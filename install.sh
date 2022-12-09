#!/bin/bash

mkdir ~/.local/share/Blox
cd ~/.local/share/Blox

git clone https://github.com/Blox-Solutions/serverscript
git clone https://github.com/Blox-Solutions/API

cd serverscript
bash run.sh &

cd ../API
npm install
npm start
