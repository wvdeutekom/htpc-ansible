#!/bin/bash

get_url() {
    $RESPONSE=$(curl -XPOST -H "Content-Length: 0" -H "X-Plex-Client-Identifier: myPlexApp" -u "wijnand@vdeute.com:D9mB2NpXaE7H" --dump-header headers https://my.plexapp.com/users/sign_in.xml)

    cat $RESPONSE | grep -A 1 '^<authentication-token>'
}
download_deb() {
    FILE=./$(date +%d-%m-%Y_plexupdate.deb)


    downloadURL=https://plex.tv/downloads/latest/1\?channel\=16\&build\=linux-ubuntu-x86_64\&distro\=ubuntu\&X-Plex-Token\={{ plex_token }}
    if [ -n "$1" ] ; then
        downloadURL=$1;
    fi

    wget $downloadURL -O /tmp/$FILE
    dpkg -i /tmp/$FILE
}

download_deb $1
#G=$0
#usage() {
#    echo "Usage:$PRG updateplex.sh [url]" >&2
#    exit 1
#}
#[ "$#" -lt 1 ] && usage
#
## parse commandline
#while [ $# -gt 0 ]
#do
#      arg="$1"
#      case "$arg" in
#         -d|--debug) echo "debug" ;;
#         -h|--help) usage ;;
#         --) shift; break;;  # no more options
#         -*) download_deb ;;
#         *) download_deb $1 ;; # not option, its some argument
#       esac
#       shift
#done
