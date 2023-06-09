#!/bin/bash
search=${1}
if [[ $search =~ .[a-z] ]]; then
        search=$(dig a $search +short)
        echo 'https://mxtoolbox.com/SuperTool.aspx?action=blacklist%3a'$search'&run=toolpage'
else
        echo 'https://mxtoolbox.com/SuperTool.aspx?action=blacklist%3a'$search'&run=toolpage'
fi
