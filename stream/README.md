STREAM
-
*What is STREAM?*

Stream is a benchmark that measures memory bandwidth and computation rate. This is useful as CPUs become faster and can become bottlenecked by a low memory bandwidth.
The benchmark measures the performance of four vector operations:

- Copy (a(i) = b(i))
- Scale (a(i) = q*b(i))
- Sum (a(i) = b(i) + c(i))
- Triad (a(i) = b(i) + q*c(i))

*Optimisation*

One way to improve STREAM results is to modify the OFFSET variable within the source code of the program.

In order to compile stream for singe node performance, the following code was used:

    gcc -fopenmp -D_OPENMP stream.c -o stream 
    export OMP_NUM_THREADS=15
    
    ./stream
    
stream_mpi.c was obtained from the stream codebase. This is an adapted copy of stream for MPI usage.

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
We test the script across multiple nodes to find the best memory transfer rate has increased by almost 3*.

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
