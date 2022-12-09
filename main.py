#import packages
import sys
import requests
import json

#get logfiles
cpulog=open("logs/cpu.log","r")
memlog=open("logs/mem.log","r")
iolog=open("logs/io.log","r")
fslog=open("logs/fs.log","r")

#open output stats file
stats=open("logs/stats.json","w+")

# logging cpudata
cpudata=cpulog.readlines()
cpudata=(cpudata[len(cpudata)-1].strip()).split()

#logging memorydata
memdata=memlog.readlines()
memdata=(memdata[len(memdata)-1].strip()).split()
#in KBs

#logging iodata
iodata=iolog.readlines()
iodata=(iodata[len(iodata)-1].strip()).split()

#logging fsdata
fsdata=fslog.readlines()
fsdata=(fsdata[len(fsdata)-1].strip()).split()
#in MBs

# json string
json='''
{
    "cpudata":
    {
        "cpus":"%s",
        "user":%f,
        "nice":%f,
        "system":%f,
        "iowait":%f,
        "steal":%f,
        "idle":%f
    },
    "memdata":
    {
        "available":%f,
        "used":%f,
        "free":%f,
        "buffers":%f,
        "cached":%f,
        "active":%f,
        "inactive":%f,
        "dirty":%f
    },
    "iodata":
    {
        "tps":%f,
        "rtps":%f,
        "wtps":%f,
        "dtps":%f,
        "bread/s":%f,
        "bwrtn/s":%f,
        "bdscd/s":%f

    },
    "fsdata":
    {
        "free":%f,
        "used":%f,
        "Ifree":%f,
        "Iused":%f,
        "Iused-percent":%f,
        "filesystem":"%s"
    }
}
''' % (
    cpudata[1],
    float(cpudata[2]),
    float(cpudata[3]),
    float(cpudata[4]),
    float(cpudata[5]),
    float(cpudata[6]),
    float(cpudata[7]),
    
    float(memdata[2]),
    float(memdata[3]),
    float(memdata[1]),
    float(memdata[5]),
    float(memdata[6]),
    float(memdata[9]),
    float(memdata[10]),
    float(memdata[11]),

    float(iodata[1]),
    float(iodata[2]),
    float(iodata[3]),
    float(iodata[4]),
    float(iodata[5]),
    float(iodata[6]),
    float(iodata[7]),

    float(fsdata[1]),
    float(fsdata[2]),
    float(fsdata[5]),
    float(fsdata[6]),
    float(fsdata[7]),
    fsdata[8]
    )

#writes to json
stats.write(json)
print("Data written, Success!")

#close files
cpulog.close()
memlog.close()
iolog.close()
fslog.close()
stats.close()
