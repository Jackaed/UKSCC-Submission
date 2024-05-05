cd ~
cp /opt/UKSCCSCC/NAMD/NAMD_3.0b6_Source.tar.gz ~
tar -xzvf NAMD_3.0b6_Source.tar.gz
cd NAMD_3.0b6_Source
tar -xvf charm-7.0.0.tar
module purge
module load tools/cmake
module load libraries/openmpi/5.0.3/gcc-13
module load compilers/gcc/13
cd charm-v7.0.0
./build charm++ mpi-linux-arm8 mpicxx -j16 --with-production
cd ..
wget http://www.ks.uiuc.edu/Research/namd/libraries/fftw-linux-arm64.tar.gz
tar -xzvf fftw-linux-arm64.tar.gz
mv fftw-linux-arm64 fftw
wget http://www.ks.uiuc.edu/Research/namd/libraries/tcl8.5.9-linux-arm64-threaded.tar.gz
tar -xzvf tcl8.5.9-linux-arm64-threaded.tar.gz
mv tcl8.5.9-linux-arm64-threaded tcl-threaded
# For whatever reason, they decided to create an arm64-threaded version of tcl, but not a normal one, so this we need to get from sourceforge
# and compile from source. Lovely.
wget https://sourceforge.net/projects/tcl/files/Tcl/8.5.9/tcl8.5.9-src.tar.gz
tar -xzvf tcl8.5.9-src.tar.gz
cd tcl8.5.9/unix
./configure --prefix=$HOME/NAMD_3.0b6_Source/tcl --enable-shared=no
make -j16
make install
cd ../..
./config Linux-ARM64-g++ --charm-arch mpi-linux-arm8-mpicxx
cd Linux-ARM64-g++
make -j16

