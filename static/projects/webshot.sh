#!/bin/bash

URL=$1
TARGET=$2

phantomjs webshot.js ${URL}
convert -resize 400x400 -crop 400x300+0+0 webshot.png ${TARGET}_400x300.png
convert -resize 645x645 -crop 645x430+0+0 webshot.png ${TARGET}_645x430.png
convert -resize 1000x1000 -crop 1000x500+0+0 webshot.png ${TARGET}_1000x500.png
convert -resize 1920x1920 -crop 1920x1080+0+0 webshot.png ${TARGET}_1920x1080.png
rm webshot.png
