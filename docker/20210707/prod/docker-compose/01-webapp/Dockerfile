From amazonlinux

RUN yum update -y && yum install -y \
    php-cli \
    php-common \
    php-fpm \
    php-gd \
    php-json \
    php-mbstring \
    php-mysqlnd \
    php-pdo \
    php-pecl-zip \
    php-xml \
    net-tools \
    unzip \
    python3 \
    golang \
    fuse \
    git \
 && pip3 install supervisor \
 && amazon-linux-extras install -y php7.3 nginx1
COPY ./php.ini /etc/php.ini
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./supervisord.conf /usr/local/supervisord.conf
COPY ./fstab /etc/fstab
RUN export GOPATH=$HOME/go \
 && go get github.com/kahing/goofys \
 && go install github.com/kahing/goofys
RUN cp /usr/share/zoneinfo/Japan /etc/localtime \
 && curl -o concrete5853.zip https://www.concrete5.org/download_file/-/view/113591/ \
 && unzip concrete5853.zip \
 && rm concrete5853.zip \
 && mv concrete5-8.5.3 concrete5853
RUN chown -R nginx:nginx concrete5853 \
 && chmod -R 775 concrete5853 \
 && chmod -R 777 concrete5853/application \
 && chmod -R 777 concrete5853/application/languages \
 && chmod -R 777 concrete5853/application/config \
 && chmod -R 777 concrete5853/application/files \
 && chmod -R 777 concrete5853/application/files \
 && chmod -R 777 concrete5853/packages \
 && mv concrete5853 /usr/share/nginx/html \
 && mkdir /usr/share/nginx/html/concrete5853/s3 \
 && chown nginx:nginx /usr/share/nginx/html/concrete5853/s3
COPY ./concrete.php /usr/share/nginx/html/concrete5853/application/config/concrete.php

CMD ["/usr/local/bin/supervisord"]