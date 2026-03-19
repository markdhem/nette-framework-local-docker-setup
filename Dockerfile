FROM php:8.2-apache

RUN apt-get update --fix-missing  && apt-get upgrade -y

#Install required system dependencies (dev libraries)
RUN apt-get update && apt-get install -y \
    # Standard dependencies
    git \
    unzip \
    # Dependencies for common extensions (zip, xml, curl)
    libzip-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    # NEW FIX: Dependency for mbstring (Oniguruma)
    libonig-dev \
    # Dependencies for GD (crucial headers)
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    # Remove lists to keep image small
    && rm -rf /var/lib/apt/lists/*

#Configure and Install PHP Extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        pdo pdo_mysql mysqli zip gd mbstring curl xml

COPY ./virtualhost.conf /etc/apache2/sites-available/000-default.conf

ADD . /var/www/html

VOLUME ["/var/www/html/config"]

RUN chown -R www-data:www-data /var/www/html

RUN docker-php-ext-install gd zip pdo pdo_mysql curl xml
RUN docker-php-ext-enable gd zip pdo pdo_mysql curl xml

RUN php -m

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

RUN composer show -p

RUN composer update

EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
