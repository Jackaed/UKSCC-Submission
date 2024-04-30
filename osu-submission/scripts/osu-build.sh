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
