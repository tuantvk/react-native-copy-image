#!/bin/bash                                                                                                         

# get app name from app.json
App=$( grep -o '"name": *"[^"]*"' app.json | grep -o '"[^"]*"$' | sed 's:^.\(.*\).$:\1:' )

# create folder drawable for android
rm -r  "android/app/src/main/res/drawable/"
mkdir "android/app/src/main/res/drawable/"


# get images from assets images
for file in assets/images/*
do
    # ==== iOS ====
    file_name="${file##*/}"
    name="${file_name%.*}"
    imageset="$name.imageset"

    # remove folder if file exits
    rm -r "ios/$App/Images.xcassets/$imageset/"

    # create new folder
    mkdir "ios/$App/Images.xcassets/$imageset/"
    cp "$file" "ios/$App/Images.xcassets/$imageset/"
    cp scripts/react-native-copy-image/Contents.txt "ios/$App/Images.xcassets/$imageset/Contents.json"
    sed -i '' -e "s/VALUE_FILENAME/$file_name/g" "ios/$App/Images.xcassets/$imageset/Contents.json"


    # ==== android ====
    cp "$file" "android/app/src/main/res/drawable/"
done