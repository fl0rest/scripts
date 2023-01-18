#!/bin/bash

self="${0##*/}"
flags=0
needIP=0
file="transfer.log"
cols=""
num="10"

show_help () {
        cat <<END_HELP

$self	search transfer.log for useful information

Usage: $self	[-c|r|a|i] [-I address] [-f filename] [-h]

Options:

	-c		Show HTTP codes
	-r		Show refferers
	-a		Show user agents
	-i		Show IPs
	-k		Specify columns to print (use with -I)
	-n		Specify the number of results (default 10)
	-I address	Specify a IP address to search for
	-f filename	Specify a file to search through

Hint: You can also use -I to search for other stuff

END_HELP
}
while getopts "I:craik:f:n:h" args; do
	case "$args" in
		I)
			needIP="$OPTARG"
			echo "NeedIP:$needIP"
			;;
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
		k)
			cols="$OPTARG"
			echo "Columns:$cols"
			;;
		f)
			file="$OPTARG"
			;;
		n)
			num="$OPTARG"
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
echo "Results:$num"
echo
if [[ $cols == "" ]]; then
	if [[ $needIP != 0 ]]; then
		if [[ $flags != 0 ]]; then
			grep "$needIP" "$file" | awk '{print '$flags'}' | sort | uniq -c | sort -rn | head -n "$num"
		else
			grep "$needIP" "$file"
		fi
	else
		cat "$file" | awk '{print '$flags'}' | sort | uniq -c | sort -rn | head -n "$num"
	fi
else
	grep "$needIP" "$file" | cut -d " " -f "$cols" | sort | uniq -c | sort -rn | head -n "$num"
fi
shift "$(($OPTIND -1))"
