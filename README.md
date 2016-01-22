[![Build Status](https://travis-ci.org/bast/gtest-demo.svg?branch=master)](https://travis-ci.org/bast/gtest-demo/builds)
[![Coverage Status](https://coveralls.io/repos/bast/gtest-demo/badge.png?branch=master)](https://coveralls.io/r/bast/gtest-demo?branch=master)
[![License](https://img.shields.io/badge/license-%20BSD--3-blue.svg)](../master/LICENSE)


gtest-demo
==========

C/C++ unit test demo using [Google Test](https://code.google.com/p/googletest) deployed to
[Travis-CI](https://travis-ci.org/bast/gtest-demo/builds) with test coverage
deployed to [Coveralls](https://coveralls.io/r/bast/gtest-demo).

- [Build and test history](https://travis-ci.org/bast/gtest-demo/builds)
- [Code coverage](https://coveralls.io/r/bast/gtest-demo)
- Licensed under [BSD-3](../master/LICENSE)


## How to build this demo

```
git clone --recursive https://github.com/bast/gtest-demo.git
cd gtest-demo
mkdir build
cd build
cmake ..
make -j
make test
```
