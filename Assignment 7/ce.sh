#!/bin/bash
for f in $1/*.jpg
	do echo $f
	mv ${f} ${f/.jpg/.JPG}
done
