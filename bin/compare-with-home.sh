#!/bin/sh

diff -x .git/ -u --unidirectional-new-file "${HOME}" . | grep -v "Only in $HOME"
