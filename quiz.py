"""
=============================================================
  ※ 팀원 C 담당 라우트(/wrongnote, /retry)는 이 파일 하단에
    제가 섹션 구분선을 두어서 그 부분부터 이어서 작성해주시면 됩니다
=============================================================
"""

from flask import Flask, request, session, jsonify, render_template
import pymysql
import random

app = Flask(__name__)
app.secret_key = "toeic_quiz_secret_key_2026"   # 세션 암호화 키

# ------------------------------------------------------------------
# DB 연결 헬퍼 (quizdb 기준)
# ------------------------------------------------------------------
def get_db():
    """
    MariaDB에 연결하여 커넥션 객체를 반환합니다.
    docker-compose 환경에서 서비스명 'mariadb'로 접근합니다.
    """
    return pymysql.connect(
        host="mariadb",          # docker-compose 서비스명
        user="quizuser",         # 팀원 A와 협의한 DB 계정
        password="quizpass",     # 팀원 A와 협의한 비밀번호
        db="quizdb",
        charset="utf8mb4",
        cursorclass=pymysql.cursors.DictCursor,
    )


# ==================================================================
#  ▼▼▼  담당 구역 시작  ▼▼▼
# ==================================================================

QUIZ_COUNT = 10          # 한 세션당 문제 수
OPTIONS_COUNT = 4        # 객관식 선지 수


# ------------------------------------------------------------------
# 0. 메인 페이지 (레벨 선택 화면 렌더링)
#    팀원 D분이 main.html을 담당하지만, Flask 라우트는 여기서 열어줍니다.
# ------------------------------------------------------------------
@app.route("/")
def index():
    return render_template("main.html")


# ------------------------------------------------------------------
# 1. 레벨 선택  POST /level
#    프론트(main.html)에서 선택한 레벨·모드를 세션에 저장하고
#    퀴즈 페이지로 리다이렉트합니다.
# ------------------------------------------------------------------
@app.route("/level", methods=["POST"])
def select_level():
    """
    요청 JSON 예시:
        { "level": 2, "mode": "eng_ko" }

    mode 값 목록 (select_mode.html 버튼 순서와 동일):
        "eng_ko"   : 영 → 한
        "ko_eng"   : 한 → 영
        "synonym"  : 영문 동의어
        "antonym"  : 영문 반의어
    """
    data = request.get_json()
    level = int(data.get("level", 1))
    mode  = data.get("mode", "eng_ko")

    # 유효성 검사
    if level not in (1, 2, 3):
        return jsonify({"error": "level 값은 1·2·3 중 하나여야 합니다."}), 400
    if mode not in ("eng_ko", "ko_eng", "synonym", "antonym"):
        return jsonify({"error": "유효하지 않은 mode 값입니다."}), 400

    # 세션 초기화 후 저장
    session["level"]        = level
    session["mode"]         = mode
    session["current_num"]  = 1           # 현재 문제 번호
    session["score"]        = 0           # 맞은 개수
    session["used_ids"]     = []          # 이미 출제된 단어 id 목록
    session["wrong_ids"]    = []          # 오답 단어 id 목록 (팀원 C 사용)

    return jsonify({"redirect": "/quiz"})


# ------------------------------------------------------------------
# 2. 문제 출제  GET /quiz
#    세션의 level·mode를 읽어 DB에서 단어를 무작위로 꺼내
#    4지선다 JSON을 반환합니다.
# ------------------------------------------------------------------
@app.route("/quiz", methods=["GET"])
def get_quiz():
    """
    반환 JSON 규격 (팀원이 공유한 규격과 동일):
    {
        "quiz_id"    : 3,
        "current_num": 1,
        "total_num"  : 10,
        "question"   : "considerable",
        "options"    : ["사려 깊은", "상당한", "고려해 볼 만한", "보수적인"],
        "answer"     : 2,
        "example"    : "The project will require a considerable amount of time.",
        "example_ko" : "그 프로젝트는 상당한 양의 시간이 필요할 것입니다."
    }
    """
    # 세션 미존재 → 레벨 선택 화면으로
    if "level" not in session:
        return jsonify({"error": "세션 없음. /level 먼저 호출하세요."}), 400

    level       = session["level"]
    mode        = session["mode"]
    current_num = session["current_num"]
    used_ids    = session["used_ids"]

    # 모든 문제를 다 풀었으면 결과 페이지로 유도
    if current_num > QUIZ_COUNT:
        return jsonify({"redirect": "/result"})

    db = get_db()
    try:
        with db.cursor() as cursor:
            # 이미 출제된 단어 제외하고 같은 레벨에서 1개 랜덤 선택
            if used_ids:
                placeholders = ",".join(["%s"] * len(used_ids))
                sql = (
                    f"SELECT id, word, meaning, synonym, antonym, example "
                    f"FROM words WHERE level=%s AND id NOT IN ({placeholders}) "
                    f"ORDER BY RAND() LIMIT 1"
                )
                cursor.execute(sql, [level] + used_ids)
            else:
                cursor.execute(
                    "SELECT id, word, meaning, synonym, antonym, example "
                    "FROM words WHERE level=%s ORDER BY RAND() LIMIT 1",
                    (level,)
                )
            row = cursor.fetchone()

            if not row:
                # 해당 레벨 단어가 부족할 경우 used_ids 초기화 후 재시도
                session["used_ids"] = []
                return get_quiz()

            # ----------------------------------------------------------
            # 모드별 question / 정답 텍스트 / 오답 풀 결정
            # ----------------------------------------------------------
            if mode == "eng_ko":
                question     = row["word"]
                correct_text = row["meaning"]
                wrong_col    = "meaning"
            elif mode == "ko_eng":
                question     = row["meaning"]
                correct_text = row["word"]
                wrong_col    = "word"
            elif mode == "synonym":
                question     = row["word"]
                correct_text = row["synonym"]
                wrong_col    = "synonym"
            else:  # antonym
                question     = row["word"]
                correct_text = row["antonym"]
                wrong_col    = "antonym"

            # ----------------------------------------------------------
            # 오답 선지 3개 생성 (같은 레벨, 정답 단어 제외)
            # ----------------------------------------------------------
            cursor.execute(
                f"SELECT {wrong_col} FROM words "
                f"WHERE level=%s AND id != %s AND {wrong_col} IS NOT NULL "
                f"AND {wrong_col} != '' "
                f"ORDER BY RAND() LIMIT %s",
                (level, row["id"], OPTIONS_COUNT - 1)
            )
            wrong_rows = cursor.fetchall()

            # 오답 데이터가 부족하면 다른 레벨에서 보충
            if len(wrong_rows) < OPTIONS_COUNT - 1:
                need = (OPTIONS_COUNT - 1) - len(wrong_rows)
                cursor.execute(
                    f"SELECT {wrong_col} FROM words "
                    f"WHERE id != %s AND {wrong_col} IS NOT NULL "
                    f"AND {wrong_col} != '' "
                    f"ORDER BY RAND() LIMIT %s",
                    (row["id"], need)
                )
                extra = cursor.fetchall()
                wrong_rows = list(wrong_rows) + list(extra)

            wrong_texts = [r[wrong_col] for r in wrong_rows]

            # ----------------------------------------------------------
            # 선지 조합 후 셔플 → 정답 번호 계산
            # ----------------------------------------------------------
            options = wrong_texts + [correct_text]
            random.shuffle(options)
            answer_index = options.index(correct_text) + 1   # 1-based

            # ----------------------------------------------------------
            # 예문 한글 해석: DB에 example_ko 컬럼이 없으므로
            # example 필드에서 한글 부분을 파싱하거나 빈 문자열 반환.
            # 현재 DB 스키마에는 example(영문)만 있으므로
            # example_ko는 빈 문자열로 처리합니다.
            # (추후 A가 컬럼 추가 시 쿼리에 example_ko 추가 필요)
            # ----------------------------------------------------------
            example_en = row["example"].strip().replace("\r", "").replace("\n", "") \
                         if row["example"] else ""
            example_ko = ""   # DB에 컬럼 추가 전까지 빈 문자열

            # 세션 업데이트 (출제된 id, 현재 문제 번호는 submit에서 올림)
            session["used_ids"] = used_ids + [row["id"]]
            # 정답 정보를 채점용으로 세션에 임시 저장
            session["current_answer"] = answer_index
            session["current_quiz_id"] = row["id"]

    finally:
        db.close()

    return jsonify({
        "quiz_id"    : row["id"],
        "current_num": current_num,
        "total_num"  : QUIZ_COUNT,
        "question"   : question,
        "options"    : options,
        "answer"     : answer_index,
        "example"    : example_en,
        "example_ko" : example_ko,
    })


# ------------------------------------------------------------------
# 3. 정답 채점  POST /submit
#    프론트에서 사용자가 선택한 번호를 받아 정오를 판별하고
#    점수를 누적합니다.
# ------------------------------------------------------------------
@app.route("/submit", methods=["POST"])
def submit_answer():
    """
    요청 JSON:
        { "selected": 2 }          ← 사용자가 클릭한 선지 번호 (1~4)

    반환 JSON:
        {
            "correct"     : true,   ← 정오 여부
            "score"       : 3,      ← 현재까지 맞은 개수
            "current_num" : 3,      ← 방금 채점한 문제 번호
            "is_last"     : false   ← 마지막 문제 여부
        }
    """
    if "level" not in session:
        return jsonify({"error": "세션 없음."}), 400

    data     = request.get_json()
    selected = int(data.get("selected", 0))
    correct  = (selected == session.get("current_answer", -1))

    if correct:
        session["score"] += 1
    else:
        # 오답 id를 팀원 C의 오답 노트용으로 저장
        wrong_ids = session.get("wrong_ids", [])
        wrong_ids.append(session.get("current_quiz_id"))
        session["wrong_ids"] = wrong_ids

    current_num          = session["current_num"]
    is_last              = (current_num >= QUIZ_COUNT)
    session["current_num"] = current_num + 1

    return jsonify({
        "correct"     : correct,
        "score"       : session["score"],
        "current_num" : current_num,
        "is_last"     : is_last,
    })


# ------------------------------------------------------------------
# 4. 결과 & 권장 단어장 추천  GET /result
#    점수 비율에 따라 다음 레벨 또는 현재 레벨 재학습을 안내합니다.
# ------------------------------------------------------------------
@app.route("/result", methods=["GET"])
def result():
    """
    권장 단어장 추천 로직:
        점수 비율 ≥ 80%  → 다음 레벨 단어장 추천
        40% < 점수 < 80% → 현재 레벨 복습 권장
        점수 비율 ≤ 40%  → 이전 레벨 단어장 추천
    """
    score      = session.get("score", 0)
    level      = session.get("level", 1)
    wrong_ids  = session.get("wrong_ids", [])
    total      = QUIZ_COUNT
    ratio      = score / total        # 0.0 ~ 1.0

    # 추천 레벨 계산
    if ratio >= 0.8:
        rec_level = min(level + 1, 3)
        feedback  = f"훌륭합니다! {score}/{total}점으로 {level}단계를 통과했어요. "
        if level < 3:
            feedback += f"다음 단계인 {rec_level}단계 단어장을 도전해보세요! 🎉"
        else:
            feedback += "최고 레벨을 마스터했습니다! 실전 토익에 도전해보세요! 🏆"
    elif ratio > 0.4:
        rec_level = level
        feedback  = (
            f"{score}/{total}점입니다. 아직 {level}단계 단어가 완전히 익숙하지 않아요. "
            f"현재 {level}단계 단어장을 한 번 더 복습한 후 재도전하세요! 💪"
        )
    else:
        rec_level = max(level - 1, 1)
        feedback  = (
            f"{score}/{total}점입니다. 기초를 다질 필요가 있어요. "
        )
        if level > 1:
            feedback += f"{rec_level}단계 단어장부터 다시 시작해보세요! 📖"
        else:
            feedback += "1단계 단어장을 충분히 익힌 후 재도전하세요! 📖"

    # 토익 응시장 추천 (제안서 기능 5번)
    test_center = _recommend_test_center()

    return render_template(
        "result.html",
        score       = score,
        total       = total,
        feedback    = feedback,
        rec_level   = rec_level,
        wrong_count = len(wrong_ids),
        test_center = test_center,
    )


def _recommend_test_center():
    """
    간단한 토익 응시장 안내 문자열을 반환합니다.
    실제 서비스에서는 위치 API와 연동할 수 있습니다.
    """
    return (
        "가장 가까운 토익 공식 시험장은 YBM 어학원 종로센터입니다. "
        "공식 홈페이지(www.toeic.co.kr)에서 시험 일정과 접수를 확인하세요."
    )


# ------------------------------------------------------------------
# 5. API: 레벨별 단어 목록 조회  GET /api/words?level=1
#    (선택 사항 - 디버깅 및 팀원 C의 오답 조회에 활용 가능)
# ------------------------------------------------------------------
@app.route("/api/words", methods=["GET"])
def api_words():
    level = request.args.get("level", 1, type=int)
    db = get_db()
    try:
        with db.cursor() as cursor:
            cursor.execute(
                "SELECT id, level, word, meaning, synonym, antonym, example "
                "FROM words WHERE level=%s ORDER BY id",
                (level,)
            )
            rows = cursor.fetchall()
    finally:
        db.close()
    return jsonify(rows)


# ==================================================================
#  ▲▲▲  제(문시연) 담당 구역 끝  ▲▲▲
# ==================================================================

# ==================================================================
#  ▼▼▼  팀원 C 담당 구역 (오답 노트 / 재시험) — 아래에 이어서 작성해주시면 됩니다  ▼▼▼
# ==================================================================
# @app.route("/wrongnote", methods=["GET"])
# def wrongnote(): ...
#
# @app.route("/retry", methods=["POST"])
# def retry(): ...


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
