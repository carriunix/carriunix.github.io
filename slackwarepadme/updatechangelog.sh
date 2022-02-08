#!/bin/bash
#
#
#
#
#
#
head -n 29 changelog.html > tmpfile
cat /home/padme/changelog.padme >> tmpfile
tail -n 14 changelog.html >> tmpfile
mv tmpfile changelog.html
