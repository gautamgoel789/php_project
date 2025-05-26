FROM php:7.4-apache

RUN a2enmod rewrite
RUN docker-php-ext-install mysqli

WORKDIR /var/www/html

COPY . /var/www/html/
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]

