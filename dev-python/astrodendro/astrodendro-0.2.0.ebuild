# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_{5,6,7,8}} )

inherit distutils-r1

DESCRIPTION="Python package for computation of astronomical dendrograms"
HOMEPAGE="https://dendrograms.readthedocs.io"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/astropy-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/h5py-0.2.0[${PYTHON_USEDEP}]
"
BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( ${RDEPEND} )
	test? (
		${RDEPEND}
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

PATCHES=( "${FILESDIR}/${P}-new-doc-building.patch" )

distutils_enable_tests setup.py
distutils_enable_sphinx docs