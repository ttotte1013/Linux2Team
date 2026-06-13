# Nginx의 경량화된 Alpine 이미지를 기반으로 사용
FROM nginx:alpine 

# Nginx 설정 파일 복사
COPY default.conf /etc/nginx/conf.d/default.conf 

# 3. Nginx의 기본 웹 루트 디렉토리에 Flask 앱의 정적 파일 복사
COPY . /usr/share/nginx/html 

# Nginx가 80번 포트에서 요청을 수신하도록 설정
EXPOSE 80 

# Nginx를 포그라운드에서 실행하여 컨테이너가 계속 실행되도록 유지
CMD ["nginx", "-g", "daemon off;"] 
