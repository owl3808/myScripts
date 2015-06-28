#!/bin/bash


CWD=$PWD

find . -name '*png' > /tmp/.rename_file
while read filename
do
	newfilename="$(echo $filename | sed 's/_server././')"
	echo $filename $newfilename
	mv $filename $newfilename
done < /tmp/.rename_file

