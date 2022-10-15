#!/bin/bash
# This script creates sample sar file outputs
sudo sar -u 5 10 | tee logs/cpu.log
sudo sar -r 5 10 | tee logs/mem.log
sudo sar -b 5 10 | tee logs/io.log
sudo sar -F 5 10 | tee logs/fs.log
