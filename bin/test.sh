#!/bin/bash

while getopts 'la:h' OPTION; do
        case "$OPTION" in
                l)
                        echo "Hello"
                        ;;
                a)
                        echo "Value is $OPTARG"
                        ;;
                h)
                        echo "-h option"
                        ;;
                ?)
                        echo "Script usage: $(basename \$0) "
                        exit 1
                        ;;
        esac
done
shift "$(($OPTIND -1))"
