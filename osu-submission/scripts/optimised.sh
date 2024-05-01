name=$1
sbatch -N 2 --ntasks-per-node=1 -w cn02,cn03 --output=$name-latency.out $name-latency.sh
sbatch -N 2 --ntasks-per-node=1 -w cn02,cn03 --output=$name-bandwidth.out $name-bandwidth.sh
