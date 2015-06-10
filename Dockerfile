FROM ubuntu:latest

RUN useradd -m -s /bin/bash hosokawa
RUN sed -i 's/main$/main universe/' /etc/apt/sources.list

RUN apt-get update

#install
RUN apt-get -y install build-essential curl sudo git fonts-inconsolata fonts-ipafont fonts-ipaexfont
RUN apt-get -y install php5 php5-sqlite php5-mysql
RUN apt-get -y install sqlite3 libsqlite3-0 libsqlite3-dev
RUN apt-get -y install emacs24-nox emacs24-el vim

RUN echo "hosokawa ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/haskell && chmod 0440 /etc/sudoers.d/haskell

RUN locale-gen en_US en_US.UTF-8 && dpkg-reconfigure locales
RUN locale-gen ja_JP ja_JP.UTF-8 && dpkg-reconfigure locales
ENV LC_ALL C
ENV LC_ALL en_US.UTF-8

RUN mkdir -p /data
VOLUME ["/data"]

USER hosokawa
WORKDIR /home/hosokawa

RUN curl -sS https://getcomposer.org/installer | php
RUN sudo -H mv composer.phar /usr/local/bin/composer
RUN composer global require "laravel/installer=~1.1"
RUN echo 'PATH=~/.composer/vendor/bin:$PATH' >> .bashrc

ADD config/init.el ~/.emacs.d/init.el

EXPOSE 80
EXPOSE 443
EXPOSE 8000
EXPOSE 8080

ENV HOME /home/hosokawa
