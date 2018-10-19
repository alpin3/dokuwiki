FROM alpin3/php7-apache
MAINTAINER kost - https://github.com/kost

ENV VERSION  2018-04-22a

RUN apk --update --no-cache add wget ca-certificates php5-curl php5-gd php5-json php5-openssl php5-xml php5-zlib \
    && mkdir /opt \
    && cd /opt \
    && wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-$VERSION.tgz \
    && tar zxf dokuwiki*.tgz \
    && rm dokuwiki*.tgz \
    && mv dokuwiki* dokuwiki \
    && chmod 755 dokuwiki \
    && chown -R apache:apache dokuwiki \
    && echo "Success"

ADD scripts/ /scripts

VOLUME ["/dokuwiki/data", "/dokuwiki/lib/plugins", "/dokuwiki/conf", "/dokuwiki/lib/tpl"]
