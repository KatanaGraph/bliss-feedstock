echo "hello from run_test.sh"
# $CXX $CXXFLAGS $LDFLAGS test_app.cpp -o test_app  && ./test_app
# pwd
g++ test_app.cpp -o test_app  && ./test_app
echo "done from run_test.sh"
