echo "hello from run_test.sh"
pwd
# $CXX $CXXFLAGS $LDFLAGS test_app.cpp -o test_app  && ./test_app
g++ test_app.cpp -o test_app  
./test_app
echo "done from run_test.sh"


# cd antlr4-cpp-example
# bash test.sh