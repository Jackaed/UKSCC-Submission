for first in {1..4}; do
	from=$(( $first + 1 ))
	for second in $(seq $from 4); do
		echo $first $second
		sbatch -N 2 --ntasks-per-node=1 -w cn0$first,cn0$second --output=latency-$first-$second.out latency-script.sh
		sbatch -N 2 --ntasks-per-node=1 -w cn0$first,cn0$second --output=bandwidth-$first-$second.out bandwidth-script.sh
	done
done
