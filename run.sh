#!/bin/bash

while :
do
  sar -u 1 10 | tee logs/cpu.log &
  sar -r 1 10 | tee logs/mem.log &
  sar -b 1 10 | tee logs/io.log &
  sar -F 1 10 | tee logs/fs.log &

  python3 main.py &
  
  cp ./logs/stats.json ../API/stats.json
  sleep 1m

done
