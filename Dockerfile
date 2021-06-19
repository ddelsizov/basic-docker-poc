FROM centos
LABEL maintainer="Danail Delsizov"
RUN dnf update -y
RUN dnf install -y httpd
COPY index.html /var/www/html
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]
EXPOSE 80