#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Two arguments are required." 1>&2
    echo "1: Host side absolute path." 1>&2
    echo "2: Container side path." 1>&2
    exit 1
fi

docker run -v $1':'$2 -w $2 -it scoring

exit 0
