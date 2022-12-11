#!/bin/bash
#A bit nicer dns command
DOMAIN=${1}
echo -n "NS: "
dig @8.8.8.8 ns $DOMAIN +short | awk '{printf "%s ",$0 } END {print ""}'
echo -n "A: "
dig @8.8.8.8 $DOMAIN +short | awk '{printf "%s ",$0} END {print ""}'
echo -n "WWW: "
dig @8.8.8.8 www.$DOMAIN +short | awk '{printf "%s ",$0} END {print ""}'
echo -n "rDNS: "
dig @8.8.8.8 -x $(dig @8.8.8.8 $DOMAIN +short) +short | awk '{printf "%s ",$0} END {print ""}'
echo -n "MX: "
dig @8.8.8.8 mx $DOMAIN +short ; dig @8.8.8.8 $(dig @8.8.8.8 mx $DOMAIN +short) +short | awk '{printf "%s ",$0} END {print ""}'
echo "-----SPF and DKIM-----"
dig @8.8.8.8 txt $DOMAIN +short
dig @8.8.8.8 txt default._domainkey.$DOMAIN +short
dig @8.8.8.8 txt _dmarc.$DOMAIN +short
