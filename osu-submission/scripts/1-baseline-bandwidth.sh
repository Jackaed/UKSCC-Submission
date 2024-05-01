#!/usr/bin/env bash
module load libraries/openmpi
mpirun -npernode 1 ../osu-bin/osu_bw
