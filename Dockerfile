# Use Debian 12 as base
FROM debian:12

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL en_US.UTF-8
ENV LANGUAGE en_US:en

# Update system and install packages
RUN apt-get update \
    && apt-get install -y \
    curl \
    wget \
    gnupg2 \
    ca-certificates \
    lsb-release \
    apt-transport-https \
    locales \
    mariadb-server

# Add PHP 7.4 repository
RUN wget https://packages.sury.org/php/apt.gpg \
    && apt-key add apt.gpg \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php7.4.list \
    && apt-get update

# Setting up locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && update-locale LANG=en_US.UTF-8

# Set root password for MySQL
RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections


# Install PHP 7.4 and extensions
RUN apt-get install -y \
    php7.4 \
    php7.4-cli \
    php7.4-common \
    php7.4-curl \
    php7.4-gd \
    php7.4-json \
    php7.4-mbstring \
    php7.4-mysql \
    php7.4-xml \
    php7.4-zip \
    php7.4-intl \  
    memcached \
    imagemagick \
    openssh-client \
    gettext \
    zip \
    git \
    subversion \
    perl \
    python2.7 \
    python3.5

# Install Node.js and npm from NodeSource PPA
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

# Install additional global packages
RUN npm install -g yarn n mocha grunt-cli webpack gulp

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Specify work directory
WORKDIR /var/www/html

# Expose port 80
EXPOSE 80

CMD ["php", "-S", "0.0.0.0:80", "-t", "/var/www/html"]
