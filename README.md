# SolArc Theme
SolArc is a flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell which supports GTK 3 and GTK 2 based desktop environments like Gnome, Unity, Budgie, Pantheon, XFCE, Mate, etc.

SolArc is a fork of the Arc theme: https://github.com/horst3180/arc-theme

Colours are based on the Solarized colour scheme by [Ethan Schoonover](https://github.com/altercation): https://github.com/altercation/solarized

Most of the work is done inside [solarize.sh](https://github.com/apheleia/solarc-theme/blob/master/solarize.sh), which replaces various Arc colours with matching Solarized colours.

## SolArc is available in three variants
### SolArc
![A screenshot of the Arc theme](https://github.com/apheleia/solarc-theme/blob/master/images/preview-light.png?raw=true)

### SolArc-Darker
![A screenshot of the Arc-Darker theme](https://github.com/apheleia/solarc-theme/blob/master/images/preview-darker.png?raw=true)

### SolArc-Dark
![A screenshot of the Arc-Dark theme](https://github.com/apheleia/solarc-theme/blob/master/images/preview-dark.png?raw=true)


## Requirements
* Gnome/GTK3 3.14 - 3.22
* The `gnome-themes-standard` package
* The murrine engine. This has different names depending on your distro.
  * `gtk-engine-murrine` (Arch Linux)
  * `gtk2-engines-murrine` (Debian, Ubuntu, elementary OS)
  * `gtk-murrine-engine` (Fedora)
  * `gtk2-engine-murrine` (openSUSE)
  * `gtk-engines-murrine` (Gentoo)

Main distributions that meet these requirements are

* Arch Linux and Arch Linux based distros
* Ubuntu 15.04 or newer (**Ubuntu 14.04 and 14.10 are not supported**)
* elementary OS Freya/Loki
* Debian 8, Testing or Unstable
* Gentoo
* Fedora 21 or newer
* openSUSE 13.2, Leap 42.1 and Tumbleweed

Derivatives of these distributions should work, as well.

If your distribution isn't listed, please check the requirements yourself.

## Installation
### Arch Linux
You can install the AUR package: [gtk-theme-solarc-git](https://aur.archlinux.org/packages/gtk-theme-solarc-git/)

### Manual Installation
**Important:** Remove all older versions of the theme from your system before you proceed any further.

    sudo rm -rf /usr/share/themes/{SolArc,SolArc-Darker,SolArc-Dark}
    rm -rf ~/.local/share/themes/{SolArc,SolArc-Darker,SolArc-Dark}
    rm -rf ~/.themes/{SolArc,SolArc-Darker,SolArc-Dark}

To build the theme you'll need
* `autoconf`
* `automake`
* `pkg-config` or `pkgconfig` if you use Fedora
* `libgtk-3-dev` for Debian based distros or `gtk3-devel` for RPM based distros
* `git` if you want to clone the source directory

If your distributions doesn't ship separate development packages you just need GTK 3 instead of the `-dev` packages.

Install the theme with the following commands

**1. Get the source**

If you want to install the latest version from git, clone the repository with

    git clone https://github.com/apheleia/solarc-theme --depth 1 && cd solarc-theme

**2. Build and install the theme**

    ./autogen.sh --prefix=/usr
    sudo make install

Other options to pass to autogen.sh are

    --disable-transparency     disable transparency in the GTK3 theme
    --disable-light            disable SolArc Light support
    --disable-darker           disable SolArc Darker support
    --disable-dark             disable SolArc Dark support
    --disable-cinnamon         disable Cinnamon support
    --disable-gnome-shell      disable GNOME Shell support
    --disable-gtk2             disable GTK2 support
    --disable-gtk3             disable GTK3 support
    --disable-metacity         disable Metacity support
    --disable-unity            disable Unity support
    --disable-xfwm             disable XFWM support

    --with-gnome=<version>     build the theme for a specific Gnome version (3.14, 3.16, 3.18, 3.20)
                               Note: Normally the correct version is detected automatically and this
                               option should not be needed.

After the installation is complete you can activate the theme with `gnome-tweak-tool` or a similar program by selecting `SolArc`, `SolArc-Darker` or `SolArc-Dark` as Window/GTK+ theme and `SolArc` or `SolArc-Dark` as Gnome-Shell and Xfce-Notify theme.

**Uninstall the theme**

Run

    sudo make uninstall

from the same directory as this README resides in, or

    sudo rm -rf /usr/share/themes/{SolArc,SolArc-Darker,SolArc-Dark}

## Contributing
Every contribution is very welcome! Please create an issue and/or a pull request.

## Troubleshooting
If you have Ubuntu with a newer GTK/Gnome version than the one included by default (i.e Ubuntu 14.04 with GTK 3.14 or Ubuntu 15.04 with GTK 3.16, etc.) the prebuilt packages won't work properly and you have to install the theme manually as described above.
This is also true for other distros with a different GTK/Gnome version than the one included by default

--

If you get artifacts like black or invisible backgrounds under Unity, disable overlay scrollbars with

    gsettings set com.canonical.desktop.interface scrollbar-mode normal

## Bug reporting
If you find a bug, please report it at https://github.com/apheleia/solarc-theme/issues

## License
SolArc is available under the terms of the GPL-3.0. See `COPYING` for details.

## Full Preview
![A full screenshot of the SolArc theme](https://github.com/apheleia/solarc-theme/blob/master/images/preview-complete.png?raw=true)
<sub>Screenshot Details: Icons: [Arc Icon Theme](https://github.com/horst3180/arc-icon-theme) | Wallpaper: [Jason Levesque](http://stuntkid.com/) | Font: [DejaVu Sans](http://dejavu-fonts.org/wiki/Main_Page)</sub>
