#!/bin/sh

filename="sites.txt"

while read URL; do
    DATE=`date +%d_%m_%y_%H%M`

    if [ ! -d "$URL" ]; then
        mkdir "$URL"
    fi

    OPTIONS="--height 1000 --crop-h 1000 --quality 80"
    ./wkhtmltoimage-amd64 $OPTIONS http://$URL ./$URL/$DATE.png

done < "$filename"
