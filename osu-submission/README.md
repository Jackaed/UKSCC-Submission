 # Notes on osu
 Sam Ezeh

 # Installation
 To install osu, we used the following script
 ```bash
git clone https://github.com/forresti/osu-micro-benchmarks
mkdir -p osu-bin
cd osu-micro-benchmarks
mkdir -p ../out
./configure --prefix=$(pwd)/../out
cd mpi/pt2pt
alias aclocals-1.15=aclocal
make CC=$(which mpicc) -j16
make install -j16
mv ../../../out/libexec/osu-micro-benchmarks/mpi/pt2pt/* ../../../osu-bin
rm -rf ../../../out
```

# Running the microbenchmarks
We used the following SLURM scripts to start the benchmarks.
Note that we need to ensure that we have exactly two processes communicating with eachother on two different nodes.
We both bandwidth and latency for all $\binom{4}{2}=6$ possible combinations of nodes. We use the `-w` flag to specifically request certain nodes in the cluster.

```bash
for first in {1..4}; do
  from=$(( $first + 1 ))
  for second in $(seq $from 4); do
    echo $first $second
    sbatch -N 2 --ntasks-per-node=1 -w cn0$first,cn0$second --output=latency-$first-$second.out latency-script.sh
    sbatch -N 2 --ntasks-per-node=1 -w cn0$first,cn0$second --output=bandwidth-$first-$second.out bandwidth-script.sh
  done
done
```

## Bandwidth
```bash
#!/usr/bin/env bash
module load libraries/openmpi
mpirun -npernode 1 ./osu-bin/osu_bw
```

## Latency
```
#!/usr/bin/env bash
module load libraries/openmpi
mpirun -npernode 1 ./osu-bin/osu_latency
```

# Results
To get a feel for the dynamics, we first ran the microbenchmark both latency and bandwidth on two arbitrary nodes.
After visualising the data with a graph, we notice that the maximum bandwidth attainable increases with the size of the message before reaching a plateau. A similar phenomenon occurs with latency, with the latency between the two nodes being constant against message size before beginning to increase linearly against the size of the message.

These align with expectations as low message sizes fit entirely inside the ethernet connections's bandwidth which we cannot exceed, whereas higher message sizes will have constrained throughput and will thus incur higher latency.

## Prelminary bandwidth results
![](images/arbitrary-bandwidth.png)


## Preliminary latency results
![](images/arbitrary-latency-log.png)

Note that the growth is linear but may look exponential due to the lograithmic scaling on the x-axis.


# Hardware analysis
We attempted to verify if these results lined up with the system's available hardware information but this proved difficult as the cluster is an AWS instance and the usual commands did not return useful information.

## `lshw` output
```bash
[sezeh@login ~]$ lshw -class network
  *-network                 
       description: Ethernet interface
       product: Elastic Network Adapter (ENA)
       vendor: Amazon.com, Inc.
       physical id: 5
       bus info: pci@0000:00:05.0
       logical name: eth0
       version: 00
       serial: 12:cf:59:23:80:95
       width: 32 bits
       clock: 33MHz
       capabilities: pciexpress msix pm bus_master cap_list ethernet physical
       configuration: broadcast=yes driver=ena driverversion=5.14.0-362.24.1.el9_3.0.1.aarch ip=172.31.92.121 latency=0 link=yes multicast=yes
       resources: irq:13 memory:80104000-80105fff memory:80106000-80107fff memory:80000000-800fffff
```

## `lspci` output
```bash
[sezeh@login ~]$ lspci -v
00:00.0 Host bridge: Amazon.com, Inc. Device 0200
	Physical Slot: 0
	Flags: fast devsel

00:01.0 Serial controller: Amazon.com, Inc. Device 8250 (prog-if 03 [16650])
	Physical Slot: 1
	Flags: fast devsel, IRQ 14
	Memory at 80108000 (32-bit, non-prefetchable) [size=4K]
	Kernel driver in use: serial

00:04.0 Non-Volatile memory controller: Amazon.com, Inc. NVMe EBS Controller (prog-if 02 [NVM Express])
	Subsystem: Amazon.com, Inc. Device 0000
	Physical Slot: 4
	Flags: bus master, fast devsel, latency 0, IRQ 12, NUMA node 0
	Memory at 80100000 (32-bit, non-prefetchable) [size=16K]
	Capabilities: <access denied>
	Kernel driver in use: nvme
	Kernel modules: nvme

00:05.0 Ethernet controller: Amazon.com, Inc. Elastic Network Adapter (ENA)
	Subsystem: Amazon.com, Inc. Elastic Network Adapter (ENA)
	Physical Slot: 5
	Flags: bus master, fast devsel, latency 0, IRQ 13
	Memory at 80104000 (32-bit, non-prefetchable) [size=8K]
	Memory at 80106000 (32-bit, non-prefetchable) [size=8K]
	Memory at 80000000 (32-bit, prefetchable) [size=1M]
	Capabilities: <access denied>
	Kernel driver in use: ena
	Kernel modules: ena
```

## `ethtool eth0`

```bash
[sezeh@login ~]$ sudo ethtool eth0
Settings for eth0:
        Current message level: 0x000004e3 (1251)
                               drv probe ifup rx_err tx_err tx_done
	Link detected: yes
```
