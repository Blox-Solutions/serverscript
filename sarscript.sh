#!/bin/bash
# This script creates sample sar file outputs
sudo sar -u 5 10 | tee cpu.log
sudo sar -r 5 10 | tee mem.log
sudo sar -b 5 10 | tee io.log
sudo sar -F 5 10 | tee fs.log
