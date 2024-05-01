#!/usr/bin/env bash

# Init
echo 50 | sudo tee /proc/sys/net/core/busy_poll
echo 50 | sudo tee /proc/sys/net/core/busy_read

module load libraries/openmpi
mpirun -npernode 1 ../osu-bin/osu_latency

# Reset
echo 0 | sudo tee /proc/sys/net/core/busy_poll
echo 0 | sudo tee /proc/sys/net/core/busy_read

