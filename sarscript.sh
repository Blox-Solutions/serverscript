#!/bin/bash
# This script creates sample sar file outputs

mkdir logs

sar -u 5 10 | tee logs/cpu.log
sar -r 5 10 | tee logs/mem.log
sar -b 5 10 | tee logs/io.log
sar -F 5 10 | tee logs/fs.log
