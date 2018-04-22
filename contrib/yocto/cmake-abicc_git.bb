SUMMARY = "CMake module for checking backward compatibility of a C/C++ library"
SECTION = "devel"
HOMEPAGE = "https://github.com/Oleh-Kravchenko/cmake-abicc"
BUGTRACKER = "https://github.com/Oleh-Kravchenko/cmake-abicc/issues"

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://LICENSE;md5=f967ca707a6df9d1e6b584c85f4d8779"

PV = "git${SRCPV}"
SRCREV = "${AUTOREV}"
SRC_URI = "git://github.com/Oleh-Kravchenko/cmake-abicc.git;protocol=https"
S = "${WORKDIR}/git"

inherit allarch cmake

DEPENDS = "cmake-version4git"
PACKAGES = "${PN}-dev"
RDEPENDS_${PN}-dev = "${PN}-dev \
	abi-compliance-checker"

FILES_${PN}-dev += "${libdir}/cmake"
