FROM python:3.11-slim # 베이스 이미지로 Python 3.11 슬림 버전 사용

WORKDIR /app # 작업 디렉토리 설정

COPY requirements.txt . # requirements.txt 파일을 컨테이너로 복사

RUN pip install --no-cache-dir -r requirements.txt # 필요한 패키지 설치

COPY . .    # 현재 디렉토리의 모든 파일을 컨테이너로 복사

EXPOSE 5000 # Flask 앱이 사용할 포트 노출

CMD ["python", "quiz.py"] # 컨테이너가 시작될 때 Flask 앱 실행