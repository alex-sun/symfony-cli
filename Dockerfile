FROM php:7-cli

WORKDIR /home

# GIT
RUN apt-get update && apt-get install git -y && git config --global user.email "you@example.com"

# symfony
RUN curl -sS https://get.symfony.com/cli/installer | bash && mv /root/.symfony/bin/symfony /usr/local/bin/symfony

# composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php --install-dir=/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"
