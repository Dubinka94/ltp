#!/bin/sh

IDENTITY=""

if [ $# -eq 1 ] && [ ! -z "$1" ]; then
  IDENTITY="$1"
else
  security find-identity -v -p codesigning
  echo "Supply identity as parameter"
  exit
fi


find pan testcases/kernel/syscalls  -perm +111 -type f \
-not -name "*.sh" -not -name "*.cgi" -not -name "*.cstemp" \
-exec codesign -s "$IDENTITY" {} \;
