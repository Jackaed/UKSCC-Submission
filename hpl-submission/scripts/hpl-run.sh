#!/usr/bin/env bash

module load libraries/openmpi/5.0.3/armclang-24.04
export OMP_PLACES=0:64:2
export OMP_NUM_THREADS=64
start="$(date)"
echo Started at $start
mpirun ./hpl-bin/bin/xhpl

echo Started at $start
echo Finished at $(date)
echo Took $t
