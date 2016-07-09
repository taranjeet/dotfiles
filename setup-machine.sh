#!/bin/bash

function is_installed(){
    which $1 > /dev/null 2>&1
}

function apt_get_install(){
    echo "Updating packages"
    # apt-get update
    echo "Installing $1"
    apt-get install -y $1
}

function add_ppa(){
    add-apt-repository "$1"
}

function configure_git(){
    git config --global user.name "$1"
    git config --global user.email "$2"
}

function install_python_package(){
    echo "Installing python package $1"
    pip install $1
}

function install_node_package(){
    npm install -g $1
}

function create_folder(){
    if [ ! -d "$1" ]; then
        mkdir "$1"
    fi
}


# Install sublime
is_installed "subl"
if [ $? -ne 0 ]; then
  add_ppa "ppa:webupd8team/sublime-text-3"
  apt_get_install "sublime-text-installer"
  cp "./Preferences.sublime-settings" "$HOME/.config/sublime-text-3/Packages/User/"
fi

# Install git
dpkg --get-selections | grep git > /dev/null 2>&1
if [ $? -ne 0 ]; then
  apt_get_install "git gitk"
  configure_git "Taranjeet" "reachtotj@gmail.com"
fi

# Install python specifics
is_installed "pip"
if [ $? -ne 0 ]; then
    apt_get_install "build-essential python-setuptools python-dev python-virtualenv python-pip"
fi

is_installed "pip3"
if [ $? -ne 0 ]; then
    apt_get_install "python3-dev python3-setuptools python3-pip"
fi

# System wide third party python packages
# Assuming that they wont be installed
# Hence skipping the check
declare -a PYTHON_PACKAGES=('greb' 'django==1.8' 'youtube-dl' 'grip' 'requests' 'pep8' 'flake8');
for each in ${PYTHON_PACKAGES[@]}
do
    install_python_package $each
done

# create `bin` in $HOME folder for local binaries
create_folder "$HOME/bin"

# create `tars` in $HOME folder to hold tar files
create_folder "$HOME/tars"

# Install java for ES
apt_get_install "python-software-properties"
add_ppa "ppa:webupd8team/java"
apt_get_install "oracle-java7-installer"

# Download and Install Es
is_installed "elasticsearch"
if [$/ -ne 0 ]; then
    wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.5.0.tar.gz -P "$HOME/tars"
    create_folder "$HOME/bin/elasticsearch1.5.0/"
    tar -xf "$HOME/tars/elasticsearch-1.5.0.tar.gz" -C "$HOME/bin/elasticsearch1.5.0/"
    ln -sf "$HOME/bin/elasticsearch1.5.0/bin/elasticsearch" "/usr/local/bin/elasticsearch"
fi

# is_installed "node"
# if [ $? -ne 0 ]; then
#     wget https://nodejs.org/dist/v4.4.3/node-v4.4.3-linux-x64.tar.xz -P "$HOME/tars"
#     create_folder "$HOME/bin/node4.4.3/"
#     tar -xf "$HOME/tars/node-v4.4.3-linux-x64.tar.xz" -C "$HOME/bin/node4.4.3/"
#     ln -sf "$HOME/bin/node4.4.3/bin/node" "/usr/bin/node"
#     ln -sf "$HOME/bin/node4.4.3/bin/npm" "/usr/bin/npm"
# fi

# is_installed "bower"
# if [ $? -ne 0 ]; then
#     install_node_package "bower"
# fi

# system montioring: htop
is_installed "htop"
if [ $? -ne 0 ]; then
    apt_get_install "htop"
fi

# install open ssh
apt_get_install "openssh-server"

# for youtube-dl
apt_get_install "libav-tools"

# create soft link for template.py
ln -sf "$HOME/.dotfiles/template.py" "/usr/local/bin/template.py"