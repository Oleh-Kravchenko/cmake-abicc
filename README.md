# Overview

CMake module for checking backward compatibility of a C/C++ library.

# Requirements

- [CMake](https://cmake.org/)
- [Git](https://www.git-scm.com/)
- [abi-compliance-checker](http://ispras.linuxbase.org/index.php/ABI_compliance_checker)

# Example

	ABICC_LIBRARIES(target1 [target2 ...])
	ABICC_HEADERS(dir1 [dir2 ...] file1 [file2 ...])
	ABICC_DUMP_FILE(DUMP file)
	ABICC_COMPARE(OLD file1 NEW file2)

# Installation

## Gentoo Linux

	$ layman -S
	$ layman -a kaa
	$ emerge dev-util/cmake-abicc -a

## Use as git submodule

## Install from sources

	$ git clone https://github.com/Oleh-Kravchenko/cmake-abicc.git
	$ cd cmake-abicc
	$ mkdir build
	$ cd build
	$ cmake -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local ..
	$ sudo make install

## Yocto

Please use recipe contrib/yocto/cmake-abicc_git.bb
