#!/bin/bash

URL=$1
TARGET=$2

phantomjs webshot.js ${URL}
convert -crop 1920x1440+0+0 -resize 400x300 webshot.png ${TARGET}_400x300.png
convert -crop 1920x1280+0+0 -resize 645x430 webshot.png ${TARGET}_645x430.png
convert -crop 1920x1080+0+0 webshot.png ${TARGET}_1920x1080.png
rm webshot.png
