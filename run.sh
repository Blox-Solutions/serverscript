#!/bin/bash

#folder to store sar outputs
mkdir logs

#install requrements for the python script
pip install -r requirements.txt

while :
do
  sar -u 1 10 | tee logs/cpu.log
  sar -r 1 10 | tee logs/mem.log
  sar -b 1 10 | tee logs/io.log
  sar -F 1 10 | tee logs/fs.log

  python3 main.py &
  
  sleep 2m

done
