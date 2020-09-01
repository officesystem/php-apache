FROM php:7.1-apache
RUN cp "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" \
  && a2enmod rewrite \
  && apt-get update \
  && apt-get install -y \
  freetds-bin \
  freetds-dev \
  freetds-common \
  libct4 \
  libsybdb5 \
  tdsodbc \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libmcrypt-dev \
  libldap2-dev \
  zlib1g-dev \
  libc-client-dev \
  firebird-dev \
  && ln -s /usr/lib/x86_64-linux-gnu/libsybdb.so /usr/lib/ \
  && docker-php-ext-install mbstring bcmath pdo pdo_dblib pdo_firebird pdo_mysql gd interbase mysqli
  
EXPOSE 80

CMD ["apache2-foreground"]
