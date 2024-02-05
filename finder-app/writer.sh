#!/bin/sh

if [ "$#" -ne 2 ];then
    echo "Error: Please provide both the directory path and the write string."
    exit 1
fi

writefile="$1"
writestr="$2"

mkdir -p `dirname $1`
touch `basename $2`

echo "$writestr" > "$writefile"

if [ "$?" -eq 0 ]; then
   echo "File '$writefile' created successfully with the specified content."
   exit 0
else
   echo "Error: Failed to create the file '$writefile'."
   exit 1
fi
