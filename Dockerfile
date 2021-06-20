FROM nginx
LABEL maintainer="Danail Delsizov"
COPY html/* /usr/share/nginx/html/
