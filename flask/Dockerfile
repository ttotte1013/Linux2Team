FROM python:3.11-slim # Python 3.11 경량 이미지 사용
WORKDIR /app # 컨테이너 내부 작업 디렉토리를 /app으로 설정
COPY requirements.txt . # 의존성 목록 파일 복사
RUN pip install --no-cache-dir -r requirements.txt # requirements.txt에 작성된 패키지 설치
COPY . . # 현재 폴더의 모든 파일을 컨테이너 내부로 복사
EXPOSE 5000 # Flask 애플리케이션이 사용할 포트 개방
CMD ["python", "quiz.py"] # 컨테이너 실행 시 quiz.py 실행

