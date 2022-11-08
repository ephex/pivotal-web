FROM php:7.4-fpm
RUN apt-get update && apt-get -y install libjpeg-dev libpng-dev zlib1g-dev libfreetype6-dev git zip

RUN docker-php-ext-configure gd \
    && docker-php-ext-install gd \
    && docker-php-ext-enable gd

RUN docker-php-ext-configure pdo \
    && docker-php-ext-install pdo \
    && docker-php-ext-enable pdo

RUN docker-php-ext-configure pdo_mysql \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-enable pdo_mysql

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
