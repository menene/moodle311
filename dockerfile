# Use the official PHP image as a base image
FROM php:7.4-apache

# Install necessary PHP extensions and other dependencies
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    libicu-dev \
    libxml2-dev \
    wget \
    unzip \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) iconv gd intl xmlrpc soap zip pdo pdo_mysql \
    && a2enmod rewrite

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Download Moodle
RUN wget https://download.moodle.org/download.php/direct/stable311/moodle-3.11.3.tgz -O moodle.tgz \
    && tar -xzf moodle.tgz \
    && mv moodle/* . \
    && rm -rf moodle moodle.tgz

# Set permissions
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]
