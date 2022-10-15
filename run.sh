#!/bin/bash

#install requrements for the python script
pip install -r requirements.txt

while :
do
  bash sarscript.sh &
  sleep 10m

  python3 main.py &

done
