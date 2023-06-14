# PHP Docker Image README

This Docker image is based on Debian 12 (Buster) and is intended to provide an environment suitable for running PHP applications, particularly those built with PHP 7.4.

## Included Packages

### Operating System and Tools
- Debian 12
- curl
- wget
- gnupg2
- ca-certificates
- lsb-release
- apt-transport-https
- locales
- mariadb-server

### PHP and Extensions
- PHP 7.4
- php7.4-cli
- php7.4-common
- php7.4-curl
- php7.4-gd
- php7.4-json
- php7.4-mbstring
- php7.4-mysql
- php7.4-xml
- php7.4-zip

### Additional Software
- memcached
- imagemagick
- openssh-client
- gettext
- zip
- git
- subversion
- perl
- python2.7
- python3.5
- Node.js (includes npm)
- Yarn (JavaScript package manager)
- n (Node version management)
- Mocha (JavaScript test framework)
- Grunt CLI (JavaScript task runner)
- Webpack (JavaScript module bundler)
- Gulp (JavaScript task runner)

### Package Managers
- Composer (PHP package manager)

## Usage
This Docker image sets its working directory to `/var/www/html`, which means that this is the directory where your PHP application should be mounted in the Docker container.

It exposes port 80, which you can map to the host.

The default command run by the container is `php -S 0.0.0.0:80 -t /var/www/html`, which starts a PHP server listening on port 80 and serving files from the `/var/www/html` directory. You can override this command if you have specific requirements for your application.

