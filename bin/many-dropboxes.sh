#!/bin/sh
echo Starting personal Dropbox
dropbox-cli start

echo Starting ASU Dropbox
HOME=/home/reed/.dropbox-work dropbox-cli start
