# rm -r /home/cpchung/miniconda3/envs/katana-dev/conda-bld/antlr*

CPU_COUNT=4
echo ${CPU_COUNT}

# sudo apt install -yd uuid 
# sudo apt install -yd uuid-dev
# sudo apt install -yd uuid-runtime
# conda list | grep uuid
echo "hello world"



rm -rf build

mkdir build

cd build
wget https://www.antlr.org/download/antlr-4.9.3-complete.jar

cmake .. \
-DCMAKE_BUILD_TYPE=DEBUG \
-DCMAKE_C_FLAGS_DEBUG="-O0 -fno-omit-frame-pointer  -fsanitize=address" \
-DCMAKE_CXX_FLAGS_DEBUG="-O0 -fno-omit-frame-pointer -fsanitize=address" \
-DCMAKE_CXX_COMPILER_LAUNCHER="/usr/bin/ccache" \
-DCMAKE_C_COMPILER_LAUNCHER="/usr/bin/ccache" \
-DCMAKE_C_COMPILER=clang-12 \
-DCMAKE_CXX_COMPILER=clang++-12  \
-DWITH_DEMO=True \
-DANTLR_JAR_LOCATION=./antlr-4.9.3-complete.jar

make -j4
echo "finish build"

cd ..
# ls dist/
# should see these from /home/cpchung/kg/forked/toolbox/packaging/antlr4-cpp-runtime-4.9.3-source/dist:
# (katana-dev) cpchung@cpchung:~/.../dist$ ls
# libantlr4-runtime.a  libantlr4-runtime.so  libantlr4-runtime.so.4.9.3


mkdir -p $PREFIX/lib/x86_64-linux-gnu/
cp dist/lib*  $PREFIX/lib/x86_64-linux-gnu/


mkdir -p $PREFIX/include/antlr4-runtime/
cp -r runtime/src/* $PREFIX/include/antlr4-runtime/

echo "finish cp"

# ./../demo/antlr4-demo


# # Install manually since the build files don't have an install target
# mkdir -p ${PREFIX}/bin
# cp bliss ${PREFIX}/bin

# mkdir -p ${PREFIX}/lib
# cp libbliss* ${PREFIX}/lib

# mkdir -p ${PREFIX}/include/bliss
# cp ../src/*.hh ${PREFIX}/include/bliss

# # Patch the header files so use bliss/ prefix
# sed -i 's@#include "\(.*\)"$@#include <bliss/\1>@' ${PREFIX}/include/bliss/*
