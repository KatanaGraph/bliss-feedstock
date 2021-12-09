pwd
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
echo "finished build"
cd ..

mkdir -p $PREFIX/lib/x86_64-linux-gnu/
cp dist/lib*  $PREFIX/lib/x86_64-linux-gnu/


mkdir -p $PREFIX/include/antlr4-runtime/
cp -r runtime/src/* $PREFIX/include/antlr4-runtime/

echo "finished cp"

./build/demo/antlr4-demo
echo "finished simple demo"



# # # Install manually since the build files don't have an install target
# # mkdir -p ${PREFIX}/bin
# # cp bliss ${PREFIX}/bin

# # mkdir -p ${PREFIX}/lib
# # cp libbliss* ${PREFIX}/lib

# # mkdir -p ${PREFIX}/include/bliss
# # cp ../src/*.hh ${PREFIX}/include/bliss

# # # Patch the header files so use bliss/ prefix
# # sed -i 's@#include "\(.*\)"$@#include <bliss/\1>@' ${PREFIX}/include/bliss/*
