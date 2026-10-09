# Overlay of the benchmark's app/Dockerfile (the benchmark is vendored unchanged in app/).
# What differs from upstream:
# - the COPY sources point into app/app/ (this folder is the build context);
# - the FLAG build argument defaults to this lab's fixed flag, the value upstream's Makefile passes (FLAG{sha256 of the benchmark id}), since the spec passes no build arguments;
# - upstream's compose environment values are baked in (ENV after FROM): MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE.
# Everything else is upstream's, line for line.

FROM php:7.4-apache
ENV MYSQL_HOST=db \
    MYSQL_USER=ctfuser \
    MYSQL_PASSWORD=MyPass1234 \
    MYSQL_DATABASE=ctf

RUN docker-php-ext-install mysqli

WORKDIR /var/www/html/

COPY app/app/ /var/www/html/

ARG FLAG=FLAG{c1aa7b7022dd4a9c8e78927cfd19d88d18a26cd73d4cca0d153f6a2e8d5170b5}
ENV FLAG=$FLAG

RUN chown -R www-data:www-data /var/www/html

CMD ["apache2-foreground"]
