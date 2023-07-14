#!/bin/bash
search=${1}
if [[ $search =~ .[a-z] ]]; then
        search=$(dig a $search +short)
        echo 'https://mxtoolbox.com/SuperTool.aspx?action=blacklist%3a'$search'&run=toolpage'
else
        echo 'https://mxtoolbox.com/SuperTool.aspx?action=blacklist%3a'$search'&run=toolpage'
fi
echo 'https://multirbl.valli.org/lookup/'$search

echo "Results from multirbl:"
echo "Not listed: "$(curl -sL multirbl.valli.org/lookup/$search | grep nof | grep -v nofollow | cut -d: -f 2 | rev | cut -c 2- | rev | awk '{ sum += $1; } END { print sum; }')
echo "Listed on: "$(curl -sL multirbl.valli.org/lookup/$search | grep Blacklist | grep -v nofollow | cut -d: -f 2 | rev | cut -c 2- | rev | awk '{ sum += $1; } END { print sum; }')
