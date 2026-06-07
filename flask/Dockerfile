# Python 3.11 경량 이미지 사용
FROM python:3.11-slim

# 컨테이너 내부 작업 디렉토리를 /app으로 설정
WORKDIR /app

# 의존성 목록 파일 복사
COPY requirements.txt .

# requirements.txt에 작성된 패키지 설치
RUN pip install --no-cache-dir -r requirements.txt

# 현재 폴더의 모든 파일을 컨테이너 내부로 복사
COPY . .

# Flask 애플리케이션이 사용할 포트 개방
EXPOSE 5000

# 컨테이너 실행 시 quiz.py 실행
CMD ["python", "quiz.py"]
