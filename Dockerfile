FROM ruby:2.2.6
LABEL description="Ruby image with Chrome and Chromedriver"
LABEL version="2.2.6"
MAINTAINER Phuoc Nguyen <ba.phuoc.nbp@gmail.com>

# Install Chrome
RUN set -ex \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" \
        >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable unzip \
    && rm -rf /var/lib/apt/lists/*

# Install Chromedriver
RUN set -ex \
    && cd /tmp \
    && wget -Nv http://chromedriver.storage.googleapis.com/2.33/chromedriver_linux64.zip \
    && unzip chromedriver_linux64.zip \
    && chmod -v +x chromedriver \
    && mv -v chromedriver /usr/local/bin/ \
    && rm -v chromedriver_linux64.zip
