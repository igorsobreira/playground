#!/bin/bash
#
# Show all existings users in the system
# Version 1.0

SORT=0

show_help() {
echo "Usage: 

    $(basename $0) [OPTIONS]

Available options:

    -h,--help     show this help
    -V,--version  show version number
    -s,--sort     sort the names alphabetically 
"
}

show_version() {
    echo -n "$(basename $0). Version: "
    grep "^# Version " $0 | cut -d " " -f 3
}

exit_if_invalid_option() {
    if test -n "$1"
    then
        echo $1 is not a valid option
        exit 1
    fi
}

case "$1" in 
    
    -h|--help)    show_help       && exit 0 ;;
    -V|--version) show_version    && exit 0 ;;
    -s|--sort)    SORT=1                    ;;
     *)           exit_if_invalid_option $1 ;;  

esac

out=$(cut -d : -f 1,5 /etc/passwd | grep -v "^#")

if test "$SORT" = 1
then
    out=$(echo "$out" | sort)
fi

echo "$out" | tr : \\t
