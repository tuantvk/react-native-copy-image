#!/bin/bash                                                                                                         

# get app name from app.json
App=$( grep -o '"name": *"[^"]*"' app.json | grep -o '"[^"]*"$' | sed 's:^.\(.*\).$:\1:' )


# create folder drawable for android
android_dir="android/app/src/main/res/drawable/"
[ ! -d "$android_dir" ] && mkdir -p "$android_dir"


# rename filename to format snake_case
for f in assets/images/*
do 
    lowercase=`echo $f | sed 's/\([a-z0-9]\)\([A-Z]\)/\1_\L\2/g'`
    mv -vn "$f" "$lowercase"
done

# get images from assets images
for file in assets/images/*
do
    # ==== iOS ====
    file_name="${file##*/}"
    name="${file_name%.*}"
    imageset="$name.imageset"

    # create folder imageset for ios
    ios_dir="ios/$App/Images.xcassets/$imageset/"
    [ ! -d "$ios_dir" ] && mkdir -p "$ios_dir"

    cp "$file" "ios/$App/Images.xcassets/$imageset/"
    cp scripts/react-native-copy-image/contents.txt "ios/$App/Images.xcassets/$imageset/Contents.json"

    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' -e "s/VALUE_FILENAME/$file_name/g" "ios/$App/Images.xcassets/$imageset/Contents.json"
    else
        sed -i -e "s/VALUE_FILENAME/$file_name/g" "ios/$App/Images.xcassets/$imageset/Contents.json"
    fi


    # ==== android ====
    cp "$file" "android/app/src/main/res/drawable/"

echo "Copy images success!"
done
