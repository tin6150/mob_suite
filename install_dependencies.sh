#!/bin/sh

## install python packages and add libraries

date
apt-get update
apt-get -y install python3 python3-pip curl

echo "==================================="

apt-get -y install mash ncbi-blast+

date
pip list > pip_list.before_install.txt
# pip install numpy pandas   # these are in requirements.txt now
echo $?
echo "==================================="
echo "===== requirements.txt ====="
echo "==================================="
pip3 install mob_suite   #  hopefully pip still work for root, wsl did this as user "tin"
#pip install -r requirements.txt
#cat requirements.txt | grep -v ^# | xargs -n 1 pip install 
echo $?

echo "==================================="
date

pip list | tee pip_list.after_install.txt

echo "==================================="

# update path, etc

# create db
which mash
which makeblastdb
mob_init

# cd /
