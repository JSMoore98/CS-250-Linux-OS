#!/bin/bash

undo="y"
path="$(readlink -f $1)"
declare -a arr
index=0

for f in "$@"
	do move="$f"
	arr+=("$(readlink -f $move)")
	mv $move ~/.Trash/$move
done

ls -a ~/.Trash

echo -n "Would you like to undelete? [y/n]"
read undo

if [[ $undo =~ ^[y]$ ]]
    then
		for f in "$@"
			do move="$f"
			mv ~/.Trash/$move ${arr[index]}
			echo "$move undeleted"
			index=$index+1
		done
fi

exit 0
