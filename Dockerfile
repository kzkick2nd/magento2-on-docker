FROM php:7.2.19-apache-stretch

RUN { \
    echo '<VirtualHost *:80>'; \
    echo '  DocumentRoot /var/www/html'; \
    echo '  <Directory /var/www/html>'; \
    echo '    AllowOverride All'; \
    echo '  </Directory>'; \
    echo '</VirtualHost>'; \
  } | tee "$APACHE_CONFDIR/conf-available/vhost.conf" \
  && a2enconf vhost && a2enmod rewrite

RUN apt-get update \
  && apt-get install -y \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
  libpng-dev \
    libxslt1-dev \
    mysql-client \
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
  && a2enmod rewrite \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
