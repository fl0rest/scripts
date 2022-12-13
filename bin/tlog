#!/bin/bash

self="${0##*/}"
flags=0
needIP=0
file="transfer.log"

show_help () {
        cat <<END_HELP

$self	search transfer.log for useful information

Usage: $self	[-c|r|a|i] [-I address] [-f filename] [-h]

Options:

	-c		Show HTTP codes
	-r		Show refferers
	-a		Show user agents
	-i		Show IPs
	-I address	Specify a IP address to search for
	-f filename	Specify a file to search through

Hint: You can also use -I to search for other stuff

END_HELP
}
while getopts "craiI:f:h" args; do
	case "$args" in
		c)
			if [[ $flags != 0 ]]; then
				flags+=",\$9"
			else
				flags="\$9"
			fi
			echo "HTTP codes"
			;;
		r)
			if [[ $flags != 0 ]]; then
				flags+=",\$11"
			else
				flags="\$11"
			fi
			echo "Referrers"
			;;
		a)
			if [[ $flags != 0 ]]; then
				flags+=",\$NF"
			else
				flags="\$NF"
			fi
			echo "User agents"
			;;
		i)
			if [[ $flags != 0 ]]; then
				flags+=",\$1"
			else
				flags="\$1"
			fi
			echo "IP addresses"
			;;
		I)
			needIP="$OPTARG"
			echo "NeedIP:$needIP"
			;;
		f)
			file="$OPTARG"
			;;
		h)
			show_help
			exit 1
			;;
		?)
			echo "Usage: $self [-c|r|a|i] [-I address] [-f filename] [-h]"
			exit 1
			;;
	esac
done
echo "File:$file"
echo
if [[ $needIP != 0 ]]; then
	if [[ $flags != 0 ]]; then
		grep "$needIP" "$file" | awk '{print '$flags'}' | sort | uniq -c | sort -rn | head
	else
		grep "$needIP" "$file"
	fi
else
	cat "$file" | awk '{print '$flags'}' | sort | uniq -c | sort -rn | head
fi
shift "$(($OPTIND -1))"
