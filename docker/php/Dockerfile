FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    libpq-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libicu-dev

RUN docker-php-ext-install pdo pdo_mysql zip gd intl mbstring exif pcntl bcmath opcache


RUN pecl install xdebug && docker-php-ext-enable xdebug


RUN echo "xdebug.mode=develop,debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.start_with_request=trigger" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini


COPY --from=composer:latest /usr/bin/composer /usr/bin/composer


RUN composer global require \
    friendsofphp/php-cs-fixer \
    phpstan/phpstan \
    squizlabs/php_codesniffer


ENV PATH="/root/.composer/vendor/bin:${PATH}"


RUN echo "opcache.enable_cli=1" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini \
    && echo "opcache.revalidate_freq=0" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini


WORKDIR /var/www