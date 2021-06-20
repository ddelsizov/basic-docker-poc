FROM centos
LABEL maintainer="Danail Delsizov"
RUN dnf update -y
RUN dnf install -y httpd
COPY html/* /var/www/html/
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]
EXPOSE 80
