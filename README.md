[![Build Status](https://travis-ci.org/bast/gtest-demo.svg?branch=master)](https://travis-ci.org/bast/gtest-demo/builds)
[![Coverage Status](https://coveralls.io/repos/bast/gtest-demo/badge.png?branch=master)](https://coveralls.io/r/bast/gtest-demo?branch=master)
[![License](https://img.shields.io/badge/license-%20BSD--3-blue.svg)](../master/LICENSE)


# gtest-demo

C/C++ unit test demo using [Google Test](https://code.google.com/p/googletest) deployed to
[Travis-CI](https://travis-ci.org/bast/gtest-demo/builds) with test coverage
deployed to [Coveralls](https://coveralls.io/r/bast/gtest-demo).

- [Build and test history](https://travis-ci.org/bast/gtest-demo/builds)
- [Code coverage](https://coveralls.io/r/bast/gtest-demo)
- Licensed under [BSD-3](../master/LICENSE)

This demo uses the approach presented by Craig Scott in https://crascit.com/2015/07/25/cmake-gtest/.


## How to build this demo

```bash
git clone https://github.com/bast/gtest-demo.git
cd gtest-demo
cmake -H. -Bbuild
cd build
cmake -DBUILD_GTEST=ON -Dgtest_build_tests=ON \
    -DBUILD_GMOCK=OFF -DINSTALL_GMOCK=OFF -DINSTALL_GTEST=OFF\
    -DCMAKE_BUILD_TYPE=Debug -L ..
cmake --build .
```


## Running the tests

Either using `ctest`:
```
$ ctest

Running tests...
Test project /home/user/gtest-demo/build
    Start 1: unit
1/1 Test #1: unit .............................   Passed    0.00 sec

100% tests passed, 0 tests failed out of 1

Total Test time (real) =   0.00 sec
```

Or directly using `unit_tests`:
```
$ ./bin/unit_tests

[==========] Running 2 tests from 1 test case.
[----------] Global test environment set-up.
[----------] 2 tests from example
[ RUN      ] example.add
[       OK ] example.add (0 ms)
[ RUN      ] example.subtract
[       OK ] example.subtract (0 ms)
[----------] 2 tests from example (1 ms total)

[----------] Global test environment tear-down
[==========] 2 tests from 1 test case ran. (1 ms total)
[  PASSED  ] 2 tests.

```


## Install the Example cmake package to a local stage dir

```bash
$ DESTDIR=/tmp/gtest-demo cmake --build . --target install
[0/1] Install the project...
-- Install configuration: "Debug"
-- Installing: /tmp/gtest-demo/usr/local/lib/libexampled.a
-- Up-to-date: /tmp/gtest-demo/usr/local/include/example.h
-- Installing: /tmp/gtest-demo/usr/local/lib/cmake/Example/ExampleTargets.cmake
-- Installing: /tmp/gtest-demo/usr/local/lib/cmake/Example/ExampleTargets-debug.cmake
-- Up-to-date: /tmp/gtest-demo/usr/local/lib/cmake/Example/ExampleConfig.cmake
-- Installing: /tmp/gtest-demo/usr/local/lib/cmake/Example/ExampleConfigVersion.cmake

```

### You may wand to build and install the Release version too (or only)

```bash
cmake -DBUILD_GTEST=ON -Dgtest_build_tests=OFF \
    -DBUILD_GMOCK=OFF -DINSTALL_GMOCK=OFF -DINSTALL_GTEST=OFF \
    -DCMAKE_BUILD_TYPE=Release -L ..

$ DESTDIR=/tmp/gtest-demo cmake --build . --target install
[0/1] Install the project...
-- Install configuration: "Release"
-- Installing: /tmp/gtest-demo/usr/local/lib/libexample.a
-- Up-to-date: /tmp/gtest-demo/usr/local/include/example.h
-- Up-to-date: /tmp/gtest-demo/usr/local/lib/cmake/Example/ExampleTargets.cmake
-- Installing: /tmp/gtest-demo/usr/local/lib/cmake/Example/ExampleTargets-release.cmake
-- Up-to-date: /tmp/gtest-demo/usr/local/lib/cmake/Example/ExampleConfig.cmake
-- Up-to-date: /tmp/gtest-demo/usr/local/lib/cmake/Example/ExampleConfigVersion.cmake

```


## Acknowledgments

- Container Travis setup thanks to [Joan Massich](https://github.com/massich).
- Clean-up in CMake code thanks to [Claus Klein](https://github.com/ClausKlein).


## References

- https://crascit.com/2015/07/25/cmake-gtest/
- https://cmake.org/cmake/help/latest/manual/cmake-packages.7.html
