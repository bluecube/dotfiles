#!/bin/bash

cd $(dirname $0)
source_dir=$(pwd)

function process()
{
    f=$1

    source_file=$source_dir/$f
    target_file=~/$f

    echo "Installing $source_file to $target_file"

    rm -rf $target_file
    mkdir -p $(dirname $target_file)
    ln -s $source_file $target_file
}

find -type f | while read f
do
    if [[ $f = ./install.sh ]] ; then continue ; fi
    if [[ $f = ./.git/* ]] ; then continue ; fi
    if [[ $f = ./.gitmodules ]] ; then continue ; fi
    if [[ $f = ./.vim/bundle/* ]] ; then continue ; fi
    process $f
done

process .vim/bundle/Vundle.vim
