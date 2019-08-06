FROM php:7.2.20-apache-buster

RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

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
  && docker-php-ext-configure \
    gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install \
    dom \
    gd \
    intl \
    mbstring \
    pdo_mysql \
    xsl \
    zip \
    soap \
    bcmath \
    sodium \
  && a2enmod rewrite \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html/
COPY --chown=www-data:www-data ./ ./
