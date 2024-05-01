#!/usr/bin/env bash

# Init
echo 50 | sudo tee /proc/sys/net/core/busy_poll
echo 50 | sudo tee /proc/sys/net/core/busy_read
dr=$(cat /proc/sys/net/ipv4/tcp_rmem)
dw=$(cat /proc/sys/net/ipv4/tcp_wmem)
echo "8192 262144 536870912" | sudo tee /proc/sys/net/ipv4/tcp_rmem
echo "4096 16384 536870912" | sudo tee /proc/sys/net/ipv4/tcp_wmem

module load libraries/openmpi
mpirun -npernode 1 ../osu-bin/osu_bw

# Reset
echo 0 | sudo tee /proc/sys/net/core/busy_poll
echo 0 | sudo tee /proc/sys/net/core/busy_read
echo $dr | sudo tee /proc/sys/net/ipv4/tcp_rmem
echo $dw | sudo tee /proc/sys/net/ipv4/tcp_wmem
