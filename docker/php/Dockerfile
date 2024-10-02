FROM php:8.2-fpm

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    # libpng-dev \
    # libwebp-dev \
    # libjpeg62-turbo-dev \
    # libfreetype6-dev \
    locales \
    zip \
    libzip-dev \
    # jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    # for multicore building by pecl 2-4 or all awailable
    # && export MAKEFLAGS="-j $(nproc)" \
    # Install NodeJS for server hot reload
    # Install chokidar module
    # cjs files not working with global installed modules
    # Clear cache
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install OPCache
RUN docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-install -j$(nproc) opcache

# Install extensions
RUN docker-php-ext-install -j$(nproc) pdo pdo_mysql mysqli zip pdo_pgsql
# RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ --with-webp=/usr/include/
# RUN docker-php-ext-install gd
RUN pecl install redis && docker-php-ext-enable redis

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add user for laravel application
# thank to https://stackoverflow.com/a/44683248
ARG UID=10004
ARG GID=10004
RUN adduser -D -H -u ${UID} -s /bin/bash www-data -G www-data
RUN mkdir -p /home/www-data && chown $UID:$UID /home/www-data -R

# Set working directory
WORKDIR /var/www/html

# Change current user to www
USER $UID

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
