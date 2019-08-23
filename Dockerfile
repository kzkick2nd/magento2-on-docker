FROM php:7.2.21-apache-buster

ARG MAGENTO_MARKET_USER
ARG MAGENTO_MARKET_PASS

# RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"
COPY php.ini-development-magento "$PHP_INI_DIR/php.ini"

RUN { \
    echo '<VirtualHost *:80>'; \
    echo '  DocumentRoot /var/www/html'; \
    echo '  <Directory /var/www/html>'; \
    echo '    AllowOverride All'; \
    echo '  </Directory>'; \
    echo '</VirtualHost>'; \
  } | tee "$APACHE_CONFDIR/conf-available/vhost.conf" \
  && a2enconf vhost && a2enmod rewrite

# Workaround for gd config with free-type
# https://github.com/docker-library/php/issues/865#issuecomment-512757283
# Use stretch's older package.
RUN echo "deb http://deb.debian.org/debian stretch main" >> /etc/apt/sources.list

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  libfreetype6-dev=2.6.3-3.2 \
  libfreetype6=2.6.3-3.2 \
  libjpeg62-turbo-dev \
  libpng-dev \
  libicu-dev \
  libxslt1-dev \
  default-mysql-client \
  libsodium-dev \
  unzip

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN docker-php-ext-install \
  gd \
  intl \
  pdo_mysql \
  xsl \
  zip \
  soap \
  bcmath

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN chown www-data:www-data /var/www

USER www-data
WORKDIR /var/www/html/

RUN composer config -g http-basic.repo.magento.com $MAGENTO_MARKET_USER $MAGENTO_MARKET_PASS
RUN composer create-project --repository=https://repo.magento.com/ magento/project-community-edition ./
RUN composer require community-engineering/japan-common

RUN chmod +x bin/magento
