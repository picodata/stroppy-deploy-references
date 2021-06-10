#!/bin/bash
# Make load peaks on Grafana dashboards for network, disk IOps
# Usage: ./stress_test.sh [workers_count] [filesize_in_gb]
#
# Example:
# To run on worker-1, worker-2, worker-3 test with 10Gb for fio
# ./stress_test.sh 3 10

# Variables
count=$1
size_arg=$2
dim=G
size="$size_arg$dim"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

# Disks load
for (( worker=1; worker<=$count; worker++ ))
do
    echo -e "${GREEN}Install fio on worker-$worker${ENDCOLOR}"
    if [[ $worker < $count ]]; then
        # If not last then run test in background
        echo -e "${GREEN}Run test in background on worker-$worker${ENDCOLOR}"
        ssh -o StrictHostKeyChecking=no worker-$worker sudo apt-get install -y fio
        ssh -o StrictHostKeyChecking=no worker-$worker sudo fio --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --name=test --filename=/opt/local-path-provisioner/test.img --bs=4k --iodepth=64 --size=$size --readwrite=randrw --rwmixread=50 &
    else
        # If last then run test in foreground
        echo -e "${GREEN}Run test in foreground on worker-$worker${ENDCOLOR}"
        ssh -o StrictHostKeyChecking=no worker-$worker sudo apt-get install -y fio
        ssh -o StrictHostKeyChecking=no worker-$worker sudo fio --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --name=test --filename=/opt/local-path-provisioner/test.img --bs=4k --iodepth=64 --size=$size --readwrite=randrw --rwmixread=50
    fi
done

# Remove artifacts
for (( worker=1; worker<=$count; worker++ ))
do
    echo -e "${GREEN}Remove /opt/local-path-provisioner/test.img on worker-$worker${ENDCOLOR}"
    ssh -o StrictHostKeyChecking=no worker-$worker sudo rm /opt/local-path-provisioner/test.img
done
