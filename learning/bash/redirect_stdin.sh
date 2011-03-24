#!/bin/bash

# just write something in `data' file
echo "first line" > data
echo "second line" >> data

exec 6<&0       # link fd 6 to stdin (backup stdin) 

exec < data     # send contents of `data' file to stdin

read l1         # read first line of `data' file
read l2         # read second line of `data' file

echo $l1
echo $l2

exec 0<&6       # restore stdin
exec 6<&-       # close fd 6

# just to make sure `read' is using stdin again

echo "type something"
read l3

echo "you typed: '$l3'"

rm data
