FROM php:7.4-apache

# Enable Apache modules
RUN a2enmod rewrite

# Install MySQL extension
RUN docker-php-ext-install mysqli

# Set working directory
WORKDIR /var/www/html

# Copy files
COPY . .

# Set basic permissions (skip specific directories)
RUN chown -R www-data:www-data /var/www/html \
    && find /var/www/html -type d -exec chmod 755 {} \; \
    && find /var/www/html -type f -exec chmod 644 {} \;

EXPOSE 80

CMD ["apache2-foreground"]
