FROM alpine:3.8
MAINTAINER acreative <support@acreative.io>

# Install base packages
RUN apk update 
RUN apk upgrade 
RUN apk add curl wget bash git which

# Install PHP7 and packages
RUN apk --update add apache2 php7 php7-apache2 ruby ruby-bundler ruby-rdoc ruby-irb curl \
    php7-mbstring \
    php7-tokenizer \
    php7-json \
    php7-phar \
    php7-openssl \
    php7-mysqli \
    php7-curl \
    php7-mcrypt \
    php7-pdo_mysql \
    php7-ctype \
    php7-gd \
    php7-xml \
    php7-dom \
    php7-iconv \
    php7-session \
    php7-simplexml \
    php7-fileinfo \
    && rm -f /var/cache/apk/* \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer