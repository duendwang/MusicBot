#!/bin/bash

cd "$(dirname $1)"

#Downloads latest version
URL=$(curl -s https://api.github.com/repos/jagrosh/MusicBot/releases/latest \
    | grep -i browser_download_url.*\.jar \
    | sed 's/.*\(http.*\)"/\1/')
FILENAME=$(echo $URL | sed 's/.*\/\([^\/]*\)/\1/')
if [ -f $FILENAME ]; then
    echo "Latest version already downloaded (${FILENAME})"
else
    curl -L $URL -o $FILENAME
fi

#Finds latest file
#unset -v latest
#for file in ./*.jar; do
#  [[ $file -nt $latest ]] && latest=$file
#done

#runs most recent jar file
java -Dnogui=true -jar $(ls -t JMusicBot* | head -1)