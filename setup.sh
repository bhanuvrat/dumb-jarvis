#! /bin/bash
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo sed -i 's/in.archive.ubuntu.com/mirror.dhakacom.com/' /etc/apt/sources.list

sudo add-apt-repository ppa:saiarcot895/myppa
sudo apt-get update
sudo apt-get -y install apt-fast

sudo apt-fast update && sudo apt-fast dist-upgrade
xargs sudo apt-fast install -y < apt-requirements.txt
xargs sudo apt-fast install -y < awesomewm_dependencies.txt

sudo pip install -r pip-requirements.txt

echo "Downloading sublime-text3"
FILE=`mktemp`
URL=`python latest_sublime_dl.py`
wget $URL -O $FILE
echo "Installing sublime text"
sudo dpkg -i $FILE

echo "Setting up Docker"
curl -sSL https://get.docker.com/ubuntu/ | sudo sh

echo "Setting up oh-my-zsh"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
sudo chsh -s /bin/zsh
