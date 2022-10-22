#!/bin/bash

#folder to store sar outputs
mkdir logs

#install requrements for the python script
pip install -r requirements.txt

while :
do
  sar -u 5 10 | tee logs/cpu.log
  sar -r 5 10 | tee logs/mem.log
  sar -b 5 10 | tee logs/io.log
  sar -F 5 10 | tee logs/fs.log

  python3 main.py &
  cp logs/stats.json ../API/
  
  echo ("Logging cycle completed")
  sleep 10m

done
