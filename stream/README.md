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


Single Node Performance
-
    [fnicholson@login ~]$ mpirun -n 16 a.out 
    -------------------------------------------------------------
    STREAM version $Revision: 1.8 $
    -------------------------------------------------------------
    This system uses 8 bytes per array element.
    -------------------------------------------------------------
    Total Aggregate Array size = 10000000 (elements)
    Total Aggregate Memory per array = 76.3 MiB (= 0.1 GiB).
    Total Aggregate memory required = 228.9 MiB (= 0.2 GiB).
    Data is distributed across 16 MPI ranks
       Array size per MPI rank = 625000 (elements)
       Memory per array per MPI rank = 4.8 MiB (= 0.0 GiB).
       Total memory per MPI rank = 14.3 MiB (= 0.0 GiB).
    -------------------------------------------------------------
    Each kernel will be executed 10 times.
     The *best* time for each kernel (excluding the first iteration)
     will be used to compute the reported bandwidth.
    The SCALAR value used for this run is 0.420000
    -------------------------------------------------------------
    Your timer granularity/precision appears to be 1 microseconds.
    Each test below will take on the order of 1583 microseconds.
       (= 1583 timer ticks)
    Increase the size of the arrays if this shows that
    you are not getting at least 20 timer ticks per test.
    -------------------------------------------------------------
    WARNING -- The above is only a rough guideline.
    For best results, please be sure you know the
    precision of your system timer.
    -------------------------------------------------------------
    Function    Best Rate MB/s  Avg time     Min time     Max time
    Copy:          99010.0     0.001716     0.001616     0.002079
    Scale:         98278.7     0.001666     0.001628     0.001795
    Add:          137678.8     0.001796     0.001743     0.001816
    Triad:        136957.3     0.001797     0.001752     0.001826
    -------------------------------------------------------------
    Solution Validates: avg error less than 1.000000e-13 on all three arrays
    -------------------------------------------------------------
    [fnicholson@login ~]$ 

MPI Performance
-
SLURM bash script:
![Screenshot 2024-05-04 at 22 14 06](https://github.com/Jackaed/UKSCC-Submission/assets/8216039/17e754f3-3647-4fbb-b425-3e7713282a0e)

    [fnicholson@login ~]$ cat slurm-797.out 
    -------------------------------------------------------------
    STREAM version $Revision: 1.8 $
    -------------------------------------------------------------
    This system uses 8 bytes per array element.
    -------------------------------------------------------------
    Total Aggregate Array size = 10000000 (elements)
    Total Aggregate Memory per array = 76.3 MiB (= 0.1 GiB).
    Total Aggregate memory required = 228.9 MiB (= 0.2 GiB).
    Data is distributed across 64 MPI ranks
       Array size per MPI rank = 156250 (elements)
       Memory per array per MPI rank = 1.2 MiB (= 0.0 GiB).
       Total memory per MPI rank = 3.6 MiB (= 0.0 GiB).
    -------------------------------------------------------------
    Each kernel will be executed 10 times.
     The *best* time for each kernel (excluding the first iteration)
     will be used to compute the reported bandwidth.
    The SCALAR value used for this run is 0.420000
    -------------------------------------------------------------
    Your timer granularity/precision appears to be 1 microseconds.
    Each test below will take on the order of 389 microseconds.
       (= 389 timer ticks)
    Increase the size of the arrays if this shows that
    you are not getting at least 20 timer ticks per test.
    -------------------------------------------------------------
    WARNING -- The above is only a rough guideline.
    For best results, please be sure you know the
    precision of your system timer.
    -------------------------------------------------------------
    Function    Best Rate MB/s  Avg time     Min time     Max time
    Copy:         275647.3     0.000618     0.000580     0.000685
    Scale:        281744.7     0.000585     0.000568     0.000619
    Add:          396688.3     0.000629     0.000605     0.000762
    Triad:        404076.5     0.000612     0.000594     0.000632
    -------------------------------------------------------------
    Solution Validates: avg error less than 1.000000e-13 on all three arrays
    -------------------------------------------------------------
    [fnicholson@login ~]$ 
