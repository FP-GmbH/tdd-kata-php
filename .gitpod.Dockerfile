
# Base image with PHP
FROM gitpod/workspace-full

# Install PHP and other necessary extensions
RUN sudo apt-get update && sudo apt-get install -y \
    php-cli \
    php-mbstring \
    php-xml \
    php-zip \
    unzip \
    && sudo apt-get clean

# Install Composer (Dependency Manager for PHP)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHPUnit
RUN composer global require phpunit/phpunit --prefer-dist

# Add composer bin to PATH
ENV PATH="/home/gitpod/.composer/vendor/bin:${PATH}"
