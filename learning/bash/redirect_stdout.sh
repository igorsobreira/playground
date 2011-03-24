#!/bin/bash

exec 6>&1           # link fd 6 to stdout (backup stdout)

exec > out.txt      # redirect stdout to `out.txt'

echo "this is going to out.txt"

exec 1>&6           # restore stdout 
exec 6>&-           # close fd 6

echo "this is going to stdout"

echo
echo "now the contents of 'out.txt':"
cat out.txt

rm out.txt
