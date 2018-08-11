FROM alpine:latest
MAINTAINER acreative <support@acreative.io>

# Install base packages
RUN apk update 
RUN apk upgrade 
RUN apk add curl wget bash git which

# Install PHP5.6 and packages
RUN apk --update add apache2 php5-apache2 curl \
    php5-json \
    php5-phar \
    php5-openssl \
    php5-mysql \
    php5-curl \
    php5-mcrypt \
    php5-pdo_mysql \
    php5-ctype \
    php5-gd \
    php5-xml \
    php5-dom \
    php5-iconv \
    && rm -f /var/cache/apk/* \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install ruby and ruby-bundler
RUN apk add ruby ruby-bundler

# Remove APK cache to keep build smaller.
RUN rm -f /var/cache/apk/*

# Install composer for Drupal 8 builds.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer