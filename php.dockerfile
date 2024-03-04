FROM php:7.4.33-apache
RUN apt update && apt install -y libmariadb-dev-compat libmariadb-dev libzip-dev libmagickwand-dev imagemagick \
  && apt-get clean \
  && docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install pdo_mysql zip bcmath gd intl opcache \
  && pecl install imagick \
  && sh -c 'echo "extension=imagick.so" > /usr/local/etc/php/conf.d/imagick.ini'

