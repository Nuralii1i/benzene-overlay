# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python{2_7,3_{5,6,7,8}} )

inherit distutils-r1

DESCRIPTION="Reproject astronomical images with Python"
HOMEPAGE="http://reproject.readthedocs.org"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/astropy-2.0[${PYTHON_USEDEP}]
	>=dev-python/astropy-healpix-0.2[${PYTHON_USEDEP}]
	>=sci-libs/scipy-0.9[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.10[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/cython[${PYTHON_USEDEP}]
	<dev-python/astropy-helpers-3.2[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx-astropy[${PYTHON_USEDEP}] )
	test? (
		dev-python/pytest-astropy[${PYTHON_USEDEP}]
		sci-libs/Shapely[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests setup.py

python_prepare_all() {
	sed -i -e '/auto_use/s/True/False/' setup.cfg || die
	export mydistutilsargs=( --offline )
	distutils-r1_python_prepare_all
}

python_compile() {
	distutils-r1_python_compile --use-system-libraries
}

python_compile_all() {
	use doc && esetup.py build_docs
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/_build/html/. )
	distutils-r1_python_install_all
}