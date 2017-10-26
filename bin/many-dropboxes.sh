#!/bin/sh
echo Starting ASU Dropbox
/home/reed/.dropbox-dist/dropboxd &

echo Starting Home Dropbox
env HOME=/home/reed/.dropbox-home /home/reed/.dropbox-home/.dropbox-dist/dropboxd &
