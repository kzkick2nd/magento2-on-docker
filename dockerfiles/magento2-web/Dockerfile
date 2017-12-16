FROM php:7.0-apache

RUN apt-get update \
  && apt-get install -y \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
    libxslt1-dev \
    mysql-client \
    vim \
  && docker-php-ext-configure \
    gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install \
    dom \
    gd \
    intl \
    mbstring \
    mcrypt \
    pdo_mysql \
    xsl \
    zip \
    soap \
  && a2enmod rewrite \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
