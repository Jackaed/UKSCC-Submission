WIP

4)
[fnicholson@login ~]$ gcc -fopenmp -D_OPENMP stream.c -o stream 
        export OMP_NUM_THREADS=15
        ./stream
<command-line>: warning: "_OPENMP" redefined
<built-in>: note: this is the location of the previous definition
-------------------------------------------------------------
STREAM version $Revision: 5.10 $
-------------------------------------------------------------
This system uses 8 bytes per array element.
-------------------------------------------------------------
Array size = 10000000 (elements), Offset = 0 (elements)
Memory per array = 76.3 MiB (= 0.1 GiB).
Total memory required = 228.9 MiB (= 0.2 GiB).
Each kernel will be executed 10 times.
 The *best* time for each kernel (excluding the first iteration)
 will be used to compute the reported bandwidth.
-------------------------------------------------------------
Number of Threads requested = 15
Number of Threads counted = 15
-------------------------------------------------------------
Your clock granularity/precision appears to be 1 microseconds.
Each test below will take on the order of 1618 microseconds.
   (= 1618 clock ticks)
Increase the size of the arrays if this shows that
you are not getting at least 20 clock ticks per test.
-------------------------------------------------------------
WARNING -- The above is only a rough guideline.
For best results, please be sure you know the
precision of your system timer.
-------------------------------------------------------------
Function    Best Rate MB/s  Avg time     Min time     Max time
Copy:           92119.2     0.001744     0.001737     0.001779
Scale:          94227.6     0.001716     0.001698     0.001733
Add:           130443.6     0.001871     0.001840     0.001923
Triad:         133629.8     0.001822     0.001796     0.001883
-------------------------------------------------------------
Solution Validates: avg error less than 1.000000e-13 on all three arrays
-------------------------------------------------------------
[fnicholson@login ~]$ 

MPI

INSTALL FOR STREAM MPI:

File from: https://www.cs.virginia.edu/stream/FTP/Code/Versions/stream_mpi.c
[fnicholson@login ~]$ mpicc stream_mpi.c 


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
Each test below will take on the order of 1688 microseconds.
   (= 1688 timer ticks)
Increase the size of the arrays if this shows that
you are not getting at least 20 timer ticks per test.
-------------------------------------------------------------
WARNING -- The above is only a rough guideline.
For best results, please be sure you know the
precision of your system timer.
-------------------------------------------------------------
Function    Best Rate MB/s  Avg time     Min time     Max time
Copy:          97766.5     0.001672     0.001637     0.001744
Scale:         98738.8     0.001677     0.001620     0.001918
Add:          134807.5     0.001811     0.001780     0.001929
Triad:        133379.8     0.001809     0.001799     0.001826
-------------------------------------------------------------
Solution Validates: avg error less than 1.000000e-13 on all three arrays
-------------------------------------------------------------

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

[fnicholson@login ~]$ sbatch streammpirun.sh 
               797       cpu streammp fnichols PD       0:00      4 (Resources)

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
