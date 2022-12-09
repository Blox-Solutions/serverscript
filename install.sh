#!/bin/bash

mkdir /etc/Blox
cd /etc/Blox

git clone https://github.com/Blox-Solutions/serverscript
git clone https://github.com/Blox-Solutions/API

cd serverscript
bash run.sh &

cd ../API
npm install
npm start