# Maintainer: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de

pkgname=gtk-theme-solarc-git
_pkgname=solarc-theme
_pkgauthor=apheleia
_gnomeversion=3.32
pkgver=817.3e68bc0
pkgrel=1
pkgdesc="A flat theme with transparent elements. Based on the Arc theme: https://github.com/horst3180/arc-theme"
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine')
makedepends=('git' 'wget' 'inkscape' 'sassc' 'optipng')
source=("${_pkgname}::git+https://github.com/schemar/${_pkgname}.git")
sha256sums=('SKIP')
conflicts=('gtk-theme-solarc')
provides=('gtk-theme-solarc')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    ./solarize.sh
}

package() {
    cd "${srcdir}/${_pkgname}"
    cd $(find . -type d -name "arc-theme*")
    ./autogen.sh --prefix=/usr --with-gnome-shell=${_gnomeversion}
    make DESTDIR="${pkgdir}" install
}
