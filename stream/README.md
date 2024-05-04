STREAM
-
In order to compile stream for singe node performance, the following code was used:

    gcc -fopenmp -D_OPENMP stream.c -o stream 
    export OMP_NUM_THREADS=15
    
    ./stream
    
Referring to the stream documentation for MPI usage:
> MPI: If you want multi-processor results, but you have a cluster or do not have an OpenMP compiler, you might consider the MPI version of STREAM ("stream_mpi.f", in the "Versions" subdirectory).  This will require that you have MPI support installed (something like MPICH), but that is a very large topic that I don't have time to address here.
 Not many MPI results are currently posted, mostly because the results are obvious -- unless something is very wrong, the performance of a cluster will be the performance of a node times the > number of nodes. STREAM does not attempt to measure the performance of the cluster network -- it is only used to help control the timers.
 One benchmark that uses an MPI version of STREAM is the HPC Challenge Benchmark, targetted at big supercomputing clusters. The web site is http://icl.cs.utk.edu/hpcc.

Command used to compile:
    `mpicc stream_mpi.c`

SLURM bash script:
![Screenshot 2024-05-04 at 22 14 06](https://github.com/Jackaed/UKSCC-Submission/assets/8216039/17e754f3-3647-4fbb-b425-3e7713282a0e)


