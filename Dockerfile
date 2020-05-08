FROM phpdockerio/php74-fpm:latest

COPY . /application

WORKDIR /application
# Fix debconf warnings upon build

ARG DEBIAN_FRONTEND=noninteractive

# Install selected extensions and other stuff
RUN apt-get update \
    && apt-get -y --no-install-recommends install  php7.4-mysql \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install git
RUN apt-get update \
    && apt-get -y install git \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

COPY ./docker/php-fpm/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/php-fpm7.4", "-F"]

EXPOSE 8080
