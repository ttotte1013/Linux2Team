# 1. 베이스 이미지로 경량화된 Nginx 알핀 버전 사용
FROM nginx:alpine

# 2. 위에서 만든 Nginx 설정 파일을 도커 컨테이너 내부로 교체
COPY default.conf /etc/nginx/conf.d/default.conf

# 3. 팀장님이 작업한 모든 HTML/CSS/JS 파일들을 Nginx 웹 루트 경로로 복사
# (현재 Dockerfile과 같은 폴더에 html 파일들이 있다고 가정)
COPY . /usr/share/nginx/html

# 4. 웹 기본 포트인 80번 포트 개방
EXPOSE 80

# 5. Nginx 서버 백그라운드 실행
CMD ["nginx", "-g", "daemon off;"]
