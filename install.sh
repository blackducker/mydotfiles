#!/usr/bin/bash
ENV=$(cd "$(dirname "$0")";pwd)
#安装brew

#安装zsh

#安装vim
if test ! $(rpm -qa | grep vim-enhanced)
then
    echo "start install vim"
    brew install vim >> install-log.txt
    if test $(grep "error" install-log.txt)
    then
        echo "install fail"
    else
        echo "install success."
        rm -rf install-log.txt

        if test -e ~/.vimrc
        then 
            echo ".vimrc exist, rename as .vimrc-default"
            mv ~/.vimrc ~./.vimrc-default

            ln -s ${ENV}/_vimrc ${ENV}/../.vimrc
            ln -s ${ENV}/vim ${EnV}/../.vim
        fi
        ln -s ${ENV}/_vimrc ${ENV}/../.vimrc
        ln -s ${ENV}/vim ${EnV}/../.vim
        mkdir vim/bundle
        mkdir vim/bundle/Vundle
        git clone https://github.com/VundleVim/Vundle.vim.git ${ENV}/vim/bundle/Vundle
        vim +PluginInstall +qall
        echo "install and condif success"
    fi
else
    echo "you have installed vim"
fi
exit 0
