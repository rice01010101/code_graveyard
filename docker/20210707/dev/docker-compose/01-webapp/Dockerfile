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
    python3
RUN pip3 install supervisor
COPY ./supervisord.conf /usr/local/supervisord.conf
RUN amazon-linux-extras install -y php7.3 nginx1
COPY ./php.ini /etc/php.ini
COPY ./nginx.conf /etc/nginx/nginx.conf
RUN cp /usr/share/zoneinfo/Japan /etc/localtime
RUN curl -o concrete5853.zip https://www.concrete5.org/download_file/-/view/113591/
RUN unzip concrete5853.zip
RUN rm concrete5853.zip
RUN mv concrete5-8.5.3 concrete5853
RUN chown -R nginx:nginx concrete5853
RUN chmod -R 775 concrete5853 \
 && chmod -R 777 concrete5853/application \
 && chmod -R 777 concrete5853/application/languages \
 && chmod -R 777 concrete5853/application/config \
 && chmod -R 777 concrete5853/application/files \
 && chmod -R 777 concrete5853/application/files \
 && chmod -R 777 concrete5853/packages
RUN  mv concrete5853 /usr/share/nginx/html

CMD ["/usr/local/bin/supervisord"]