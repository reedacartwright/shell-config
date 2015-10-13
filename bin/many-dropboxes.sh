#!/bin/sh
echo Starting personal Dropbox
/home/reed/.dropbox-dist/dropboxd &

echo Starting ASU Dropbox
HOME=/home/reed/.dropbox-work /home/reed/.dropbox-work/.dropbox-dist/dropboxd &
