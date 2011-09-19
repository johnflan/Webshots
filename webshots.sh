#!/bin/sh

filename="sites.txt"

while read URL; do
    dtg=`date +%d_%m_%y_%H%M`

    if [ ! -d "$URL" ]; then
        mkdir "$URL"
    fi

    OPTIONS="--height 1000 --crop-h 1000 --quality 80"
    genPDFOfSite="./wkhtmltoimage-amd64 $OPTIONS http://$URL ./$URL.png"
    $genPDFOfSite

    movecmd="mv ./$URL.png ./$URL/$dtg.png"
    $movecmd

done < "$filename"
