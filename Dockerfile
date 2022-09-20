FROM php:7.3-cli
LABEL Creator="bayo"
USER root
WORKDIR  /var/www/html

ENV MYSQL_HOST=mysqlserverhost
ENV MYSQL_DATABASE=tododb
ENV MYSQL_USERNAME=todo
ENV MYSQL_PASSWORD=password
ENV MYSQL_CONNECTION=mysql
ENV MYSQL_PORT=3306

RUN apt-get update && apt-get install -y \
    libpng-dev \
    zlib1g-dev \
    libxml2-dev \
    libzip-dev \
    libonig-dev \
    zip \
    curl \
    unzip \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install zip \
    && docker-php-source delete

COPY . .

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENTRYPOINT [  "bash", "start-apache.sh" ]
