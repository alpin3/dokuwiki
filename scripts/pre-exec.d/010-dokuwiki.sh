#!/bin/sh

set -x

if [ "$SUBURI" == "" ]; then
	echo "[i] Using default URI: /"
	SUBURI="/"
fi
echo "[i] Serving URI: $SUBURI"


if [ -f /etc/apache2/conf.d/dokuwiki.conf ]; then
	echo "[i] SUBURI already configured!"
else
	echo "[i] Configuring URI: $SUBURI"
	cat <<EOF > /etc/apache2/conf.d/dokuwiki.conf
<Directory /opt/dokuwiki>
    Options FollowSymLinks
    AllowOverride All
    Require all granted
</Directory>

Alias $SUBURI "/opt/dokuwiki/"
EOF
fi
