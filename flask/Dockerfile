# Python 3.11 버전의 경량화된 이미지 사용 
FROM python:3.11-slim 
# 작업 디렉토리 설정
WORKDIR /app 
# requirements.txt 파일을 컨테이너로 복사
COPY requirements.txt . 
# 필요한 패키지 설치
RUN pip install --no-cache-dir -r requirements.txt 
# 현재 디렉토리의 모든 파일을 컨테이너로 복사
COPY . .    
# Flask 앱이 사용할 포트 노출
EXPOSE 5000 
# 컨테이너가 시작될 때 Flask 앱 실행
CMD ["python", "quiz.py"] 