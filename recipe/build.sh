rm -rf build
mkdir build
cd build

CPU_COUNT=4
PREFIX=4
echo ${CPU_COUNT}
echo ${PREFIX}

# cmake -B . -S .. -Wno-dev
# make -j${CPU_COUNT}



# # Install manually since the build files don't have an install target
# mkdir -p ${PREFIX}/bin
# cp bliss ${PREFIX}/bin

# mkdir -p ${PREFIX}/lib
# cp libbliss* ${PREFIX}/lib

# mkdir -p ${PREFIX}/include/bliss
# cp ../src/*.hh ${PREFIX}/include/bliss

# # Patch the header files so use bliss/ prefix
# sed -i 's@#include "\(.*\)"$@#include <bliss/\1>@' ${PREFIX}/include/bliss/*
