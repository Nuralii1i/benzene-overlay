# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Astropy affiliated package for accessing Virtual Observatory data and services"
HOMEPAGE="https://pyvo.readthedocs.io"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc intersphinx"
PROPERTIES="test_network"
RESTRICT="test
	intersphinx? ( network-sandbox )"
REQUIRED_USE="intersphinx? ( doc )"

RDEPEND="dev-python/astropy[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/python-mimeparse[${PYTHON_USEDEP}]
"
BDEPEND="dev-python/setuptools_scm[${PYTHON_USEDEP}]
	doc? (
		${RDEPEND}
		dev-python/sphinx-astropy[${PYTHON_USEDEP}]
		media-gfx/graphviz
	)
	test? (
		dev-python/requests-mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
#distutils_enable_sphinx docs dev-python/sphinx-astropy

python_compile_all() {
	if use doc; then
		pushd docs || die
		VARTEXFONTS="${T}"/fonts MPLCONFIGDIR="${T}" PYTHONPATH="${BUILD_DIR}"/lib \
			emake "SPHINXOPTS=$(usex intersphinx '' '-D disable_intersphinx=1')" html
		popd || die
		HTML_DOCS=( docs/_build/html/. )
	fi
}