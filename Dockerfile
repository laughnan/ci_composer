FROM alpine:latest
MAINTAINER acreative <support@acreative.io>

# Install base packages
RUN apk update 
RUN apk upgrade 
RUN apk add curl wget bash git which

# Install PHP5.6 and packages
RUN apk add php5 php5-mbstring php5-xml php5-xmlrpc php5-gd php5-pdo

# Install ruby and ruby-bundler
RUN apk add ruby ruby-bundler

# Remove APK cache to keep build smaller.
RUN rm -f /var/cache/apk/*

# Install composer for Drupal 8 builds.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer