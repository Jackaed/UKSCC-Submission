module load libraries/openmpi/5.0.3
module use /home/sezeh/hpl/arm-pl/install/modulefiles
module load compilers/armclang/24.04
module load armpl
flags="-ffast-math -funsafe-math-optimizations -march=native -mcpu=native -armpl"
rm -r hpl-2.3
if [ ! -f hpl-2.3.tar.gz ]; then
	wget https://www.netlib.org/benchmark/hpl/hpl-2.3.tar.gz 
fi
if [ ! -d hpl-2.3 ]; then
	tar -xvf hpl-2.3.tar.gz
fi
dir=$(pwd)
cd hpl-2.3
mkdir $dir/hpl-bin -p
export CFLAGS=$flags
./configure CC=armclang --prefix=$dir/hpl-bin
make -j16
make install
