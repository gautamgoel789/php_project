# Use the official PHP image with Apache
FROM php:7.4-apache

# Enable Apache mod_rewrite (necessary for clean URLs)
RUN a2enmod rewrite

# Install MySQLi extension for PHP (to connect to MySQL)
RUN docker-php-ext-install mysqli

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy the PHP code from the local machine to the container's web root directory
COPY . /var/www/html/

# Set the permissions for the copied files (optional, but recommended)
RUN chown -R www-data:www-data /var/www/html

# Expose port 80 (default HTTP port for Apache)
EXPOSE 80

# Start Apache server
CMD ["apache2-foreground"]
