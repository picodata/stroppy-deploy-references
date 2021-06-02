#!/bin/bash
mkdir -p 'png/width=1500&height=1000/light/'
mkdir -p 'png/width=1500&height=1000/dark/'
mkdir -p 'png/width=1000&height=500/light/'
mkdir -p 'png/width=1000&height=500/dark/'
start=$1
end=$2
for size in "width=1000&height=500" "width=1500&height=1000"
do
    for (( i=1; i <= 3; i++ ))
    do
    curl -s -o png/$size/light/cpu-worker-$i.png                 "http://admin:admin@localhost:3000/render/d-solo/rYdddlPWk/node-exporter-full?orgId=1&from=$start&to=$end&var-job=node&var-node=worker-$i:9100&var-diskdevices=%5Ba-z%5D%2B%7Cnvme%5B0-9%5D%2Bn%5B0-9%5D%2B&theme=light&panelId=77&$size&tz=Europe%2FMoscow" &\
    curl -s -o png/$size/light/cpu-details-worker-$i.png         "http://admin:admin@localhost:3000/render/d-solo/rYdddlPWk/node-exporter-full?orgId=1&from=$start&to=$end&var-job=node&var-node=worker-$i:9100&var-diskdevices=%5Ba-z%5D%2B%7Cnvme%5B0-9%5D%2Bn%5B0-9%5D%2B&theme=light&panelId=3&$size&tz=Europe%2FMoscow" &\
    curl -s -o png/$size/light/ram-worker-$i.png                 "http://admin:admin@localhost:3000/render/d-solo/rYdddlPWk/node-exporter-full?orgId=1&from=$start&to=$end&var-job=node&var-node=worker-$i:9100&var-diskdevices=%5Ba-z%5D%2B%7Cnvme%5B0-9%5D%2Bn%5B0-9%5D%2B&theme=light&panelId=78&$size&tz=Europe%2FMoscow" &\
    curl -s -o png/$size/light/ram-details-worker-$i.png         "http://admin:admin@localhost:3000/render/d-solo/rYdddlPWk/node-exporter-full?orgId=1&from=$start&to=$end&var-job=node&var-node=worker-$i:9100&var-diskdevices=%5Ba-z%5D%2B%7Cnvme%5B0-9%5D%2Bn%5B0-9%5D%2B&theme=light&panelId=24&$size&tz=Europe%2FMoscow" &\
    curl -s -o png/$size/light/network-worker-$i.png             "http://admin:admin@localhost:3000/render/d-solo/rYdddlPWk/node-exporter-full?orgId=1&from=$start&to=$end&var-job=node&var-node=worker-$i:9100&var-diskdevices=%5Ba-z%5D%2B%7Cnvme%5B0-9%5D%2Bn%5B0-9%5D%2B&theme=light&panelId=74&$size&tz=Europe%2FMoscow"
    curl -s -o png/$size/light/disk-space-used-worker-$i.png     "http://admin:admin@localhost:3000/render/d-solo/rYdddlPWk/node-exporter-full?orgId=1&from=$start&to=$end&var-job=node&var-node=worker-$i:9100&var-diskdevices=%5Ba-z%5D%2B%7Cnvme%5B0-9%5D%2Bn%5B0-9%5D%2B&theme=light&panelId=156&$size&tz=Europe%2FMoscow" &\
    curl -s -o png/$size/light/disk-iops-worker-$i.png           "http://admin:admin@localhost:3000/render/d-solo/rYdddlPWk/node-exporter-full?orgId=1&from=$start&to=$end&var-job=node&var-node=worker-$i:9100&var-diskdevices=%5Ba-z%5D%2B%7Cnvme%5B0-9%5D%2Bn%5B0-9%5D%2B&theme=light&panelId=229&$size&tz=Europe%2FMoscow" &\
    curl -s -o png/$size/light/disk-io-usage-rw-worker-$i.png    "http://admin:admin@localhost:3000/render/d-solo/rYdddlPWk/node-exporter-full?orgId=1&from=$start&to=$end&var-job=node&var-node=worker-$i:9100&var-diskdevices=%5Ba-z%5D%2B%7Cnvme%5B0-9%5D%2Bn%5B0-9%5D%2B&theme=light&panelId=42&$size&tz=Europe%2FMoscow" &\
    curl -s -o png/$size/light/disk-io-utilization-worker-$i.png "http://admin:admin@localhost:3000/render/d-solo/rYdddlPWk/node-exporter-full?orgId=1&from=$start&to=$end&var-job=node&var-node=worker-$i:9100&var-diskdevices=%5Ba-z%5D%2B%7Cnvme%5B0-9%5D%2Bn%5B0-9%5D%2B&theme=light&panelId=127&$size&tz=Europe%2FMoscow" &\
    curl -s -o png/$size/light/system-load-worker-$i.png         "http://admin:admin@localhost:3000/render/d-solo/rYdddlPWk/node-exporter-full?orgId=1&from=$start&to=$end&var-job=node&var-node=worker-$i:9100&var-diskdevices=%5Ba-z%5D%2B%7Cnvme%5B0-9%5D%2Bn%5B0-9%5D%2B&theme=light&panelId=7&$size&tz=Europe%2FMoscow"

    curl -s -o png/$size/dark/cpu-worker-$i.png                 "http://admin:admin@localhost:3000/render/d-solo/rYdddlPWk/node-exporter-full?orgId=1&from=$start&to=$end&var-job=node&var-node=worker-$i:9100&var-diskdevices=%5Ba-z%5D%2B%7Cnvme%5B0-9%5D%2Bn%5B0-9%5D%2B&panelId=77&$size&tz=Europe%2FMoscow" &\
    curl -s -o png/$size/dark/cpu-details-worker-$i.png         "http://admin:admin@localhost:3000/render/d-solo/rYdddlPWk/node-exporter-full?orgId=1&from=$start&to=$end&var-job=node&var-node=worker-$i:9100&var-diskdevices=%5Ba-z%5D%2B%7Cnvme%5B0-9%5D%2Bn%5B0-9%5D%2B&panelId=3&$size&tz=Europe%2FMoscow" &\
    curl -s -o png/$size/dark/ram-worker-$i.png                 "http://admin:admin@localhost:3000/render/d-solo/rYdddlPWk/node-exporter-full?orgId=1&from=$start&to=$end&var-job=node&var-node=worker-$i:9100&var-diskdevices=%5Ba-z%5D%2B%7Cnvme%5B0-9%5D%2Bn%5B0-9%5D%2B&panelId=78&$size&tz=Europe%2FMoscow" &\
    curl -s -o png/$size/dark/ram-details-worker-$i.png         "http://admin:admin@localhost:3000/render/d-solo/rYdddlPWk/node-exporter-full?orgId=1&from=$start&to=$end&var-job=node&var-node=worker-$i:9100&var-diskdevices=%5Ba-z%5D%2B%7Cnvme%5B0-9%5D%2Bn%5B0-9%5D%2B&panelId=24&$size&tz=Europe%2FMoscow" &\
    curl -s -o png/$size/dark/network-worker-$i.png             "http://admin:admin@localhost:3000/render/d-solo/rYdddlPWk/node-exporter-full?orgId=1&from=$start&to=$end&var-job=node&var-node=worker-$i:9100&var-diskdevices=%5Ba-z%5D%2B%7Cnvme%5B0-9%5D%2Bn%5B0-9%5D%2B&panelId=74&$size&tz=Europe%2FMoscow"
    curl -s -o png/$size/dark/disk-space-used-worker-$i.png     "http://admin:admin@localhost:3000/render/d-solo/rYdddlPWk/node-exporter-full?orgId=1&from=$start&to=$end&var-job=node&var-node=worker-$i:9100&var-diskdevices=%5Ba-z%5D%2B%7Cnvme%5B0-9%5D%2Bn%5B0-9%5D%2B&panelId=156&$size&tz=Europe%2FMoscow" &\
    curl -s -o png/$size/dark/disk-iops-worker-$i.png           "http://admin:admin@localhost:3000/render/d-solo/rYdddlPWk/node-exporter-full?orgId=1&from=$start&to=$end&var-job=node&var-node=worker-$i:9100&var-diskdevices=%5Ba-z%5D%2B%7Cnvme%5B0-9%5D%2Bn%5B0-9%5D%2B&panelId=229&$size&tz=Europe%2FMoscow" &\
    curl -s -o png/$size/dark/disk-io-usage-rw-worker-$i.png    "http://admin:admin@localhost:3000/render/d-solo/rYdddlPWk/node-exporter-full?orgId=1&from=$start&to=$end&var-job=node&var-node=worker-$i:9100&var-diskdevices=%5Ba-z%5D%2B%7Cnvme%5B0-9%5D%2Bn%5B0-9%5D%2B&panelId=42&$size&tz=Europe%2FMoscow" &\
    curl -s -o png/$size/dark/disk-io-utilization-worker-$i.png "http://admin:admin@localhost:3000/render/d-solo/rYdddlPWk/node-exporter-full?orgId=1&from=$start&to=$end&var-job=node&var-node=worker-$i:9100&var-diskdevices=%5Ba-z%5D%2B%7Cnvme%5B0-9%5D%2Bn%5B0-9%5D%2B&panelId=127&$size&tz=Europe%2FMoscow" &\
    curl -s -o png/$size/dark/system-load-worker-$i.png         "http://admin:admin@localhost:3000/render/d-solo/rYdddlPWk/node-exporter-full?orgId=1&from=$start&to=$end&var-job=node&var-node=worker-$i:9100&var-diskdevices=%5Ba-z%5D%2B%7Cnvme%5B0-9%5D%2Bn%5B0-9%5D%2B&panelId=7&$size&tz=Europe%2FMoscow"
    done
done
sleep 5
mv 'png/width=1500&height=1000' png/1500x1000
mv 'png/width=1000&height=500' png/1000x500
tar cfvz png.tar.gz png
