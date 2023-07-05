# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="Pytest plugin with advanced doctest features"
HOMEPAGE="https://github.com/astropy/pytest-doctestplus"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
PROPERTIES="test_network"
RESTRICT="test"
RDEPEND=">=dev-python/pytest-4.6[${PYTHON_USEDEP}]
	>=dev-python/setuptools-30.3.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-17.0[${PYTHON_USEDEP}]"
BDEPEND="dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-remotedata[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
