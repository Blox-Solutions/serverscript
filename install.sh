#!/bin/bash

mkdir ~/.local/share/Blox
cd ~/.local/share/Blox

git clone https://github.com/Blox-Solutions/serverscript
git clone https://github.com/Blox-Solutions/API

cd API
npm install
npm start &

sleep 5s

cd ../serverscript
#folder to store sar outputs
mkdir logs

#install requrements for the python script
pip install -r requirements.txt

bash run.sh &
