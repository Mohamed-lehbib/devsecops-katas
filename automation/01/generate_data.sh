#!/bin/bash

#defining the directory
DOWNLOADS_DIR="downloads"

# Creating the downloads directory and populating it with fake files
mkdir -p $DOWNLOADS_DIR \
&& cd $DOWNLOADS_DIR || exit \
&& touch file{1..7}.txt file{1..7}.mp3 file{1..7}.zip file{1..7}.pdf file{1..7}.iso \
&& ls

# Looping through all files in the directory
for file in *
do
    # Extracting the file extension
    ext="${file##*.}"

    # If the extension is not empty and the directory does not exist, create it
    if [[ ! -z "$ext" && ! -d "$ext" ]]; then
        mkdir "$ext"
    fi

    # Moving the file to the corresponding directory
    if [ ! -d "$file" ]; then
        mv "$file" "$ext/"
    fi
done