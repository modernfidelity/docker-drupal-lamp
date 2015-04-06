FROM ubuntu:14.04

MAINTAINER @modernfidelity

# Set ENVs
# -----------------------------

ENV HOME /root
ENV GOPATH /root/go
ENV PATH /root/go/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin


# GOPATH
# -----------------------------

RUN mkdir -p /root/go
RUN mkdir -p /root/go/src


RUN apt-get update -y


# Install GO Linux Deps
# -----------------------------

RUN apt-get install -y pkg-config git libcurl3-dev curl
RUN apt-get install -y golang


# Install PHP + APACHE base packages
# -----------------------------

RUN apt-get -yq install \
        curl \
        apache2 \
        openssh-server \
        libapache2-mod-php5 \
        php5-mysql \
        php5-gd \
        php5-curl \
        php-pear \
        php-apc

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Enable Apache Mods.
# -----------------------------

RUN a2enmod php5
RUN a2enmod rewrite

# Document that the service listens on port 80
EXPOSE 80 22

# By default, simply start apache.
CMD /usr/sbin/apache2ctl -D FOREGROUND