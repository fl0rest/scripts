#!/bin/bash
DOMAIN=${1}
echo "Name servers: " ; dig @8.8.8.8 ns $DOMAIN +short
echo "A record: "
dig @8.8.8.8 a $DOMAIN +short
echo "WWW record: "
dig @8.8.8.8 www.$DOMAIN +short
echo "rDNS: "
dig @8.8.8.8 -x $(dig @8.8.8.8 $DOMAIN +short) +short
echo "MX records: "
dig @8.8.8.8 mx $DOMAIN +short ; dig @8.8.8.8 $(dig @8.8.8.8 mx $DOMAIN +short) +short
echo "SPF, DKIM & DMARC"
dig @8.8.8.8 txt $DOMAIN +short
dig @8.8.8.8 txt default._domainkey.$DOMAIN +short
dig @8.8.8.8 txt _dmarc.$DOMAIN +short
