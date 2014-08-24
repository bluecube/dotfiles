#!/bin/bash

cd $(dirname $0)
source_dir=$(pwd)

find -type f | while read f
do
    if [[ $f = ./.install.sh ]] ; then continue ; fi
    if [[ $f = ./.git/* ]] ; then continue ; fi

    source_file=$source_dir/$f
    target_file=~/$f

    echo "Installing $source_file to $target_file"

    rm -f $target_file
    mkdir -p $(dirname $target_file)
    ln -s $source_file $target_file
done
