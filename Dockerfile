FROM ghcr.io/alpin3/php83-apache
MAINTAINER kost - https://github.com/kost

ENV VERSION  2024-02-06b

RUN apk --update --no-cache add wget ca-certificates php83-session php83-curl php83-gd php83-json php83-openssl php83-intl php83-xml php83-zlib php83-ldap php83-pdo_sqlite \
    && mkdir -p /opt \
    && cd /opt \
    && wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-$VERSION.tgz \
    && tar zxf dokuwiki*.tgz \
    && rm dokuwiki*.tgz \
    && mv dokuwiki* dokuwiki \
    && chmod 755 dokuwiki \
    && chown -R apache:apache dokuwiki \
    && echo "Success"

ADD scripts/ /scripts

VOLUME ["/opt/dokuwiki/data", "/opt/dokuwiki/lib/plugins", "/opt/dokuwiki/conf", "/opt/dokuwiki/lib/tpl"]
