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
bash run.sh &
