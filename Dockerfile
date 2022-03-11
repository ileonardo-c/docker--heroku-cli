FROM alpine:3.13
LABEL maintainer="Leonardo C. Carvalho <i.leonardo.c.c@outlook.com>"

RUN apk update && apk upgrade \
    && apk --no-cache add \
        ruby-dev \
        curl \
        git \
        nodejs \
        npm \
    && npm install heroku -g --no-progress --silent \
        && heroku version \
    && gem install dpl \
        dpl version

RUN rm -rf /var/cache/apk/* \
    && npm cache clean --force
