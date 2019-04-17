#!/bin/bash

# Github release to base from
ARCVERSION="20190330"

# Directory to spit the clean themes out to
BUILDDIR="`pwd`/build"

# 3.22 has to be used to target 3.24
GTK3VER="3.22"

# Gnome shell version, if not autodetecting
GNOMEVER="3.28"

# Theme types to actually build (or rather, not build =P)
AUTOGENFLAGS="--prefix=${BUILDDIR}/usr --with-gnome=${GTK3VER} --with-gnome-shell=${GNOMEVER} --disable-plank --disable-openbox" # plank & openbox not patched atm.

# Pull the Arc source
wget "https://github.com/NicoHood/arc-theme/releases/download/${ARCVERSION}/arc-theme-${ARCVERSION}.tar.xz"
tar -xJf "arc-theme-${ARCVERSION}.tar.xz"
rm "arc-theme-${ARCVERSION}.tar.xz"

# Arc colors
## SCSS
A_BASE="404552"
A_TEXT="d3dae3"
A_BG="383c4a"
A_FG="$A_TEXT"
A_SELECTED_FG="ffffff"
A_SELECTED_BG="5294e2"
A_WARNING="f27835"
A_ERROR="fc4138"
A_SUCCESS="73d216"
A_DESTRUCTIVE="f04a50"
A_SUGGESTED="4dadd4"
A_DROP_TARGET="f08437"
A_WM_BUTTON_CLOSE_BG="cc575d"
A_WM_BUTTON_CLOSE_HOVER_BG="d7787d"
A_WM_BUTTON_CLOSE_ACTIVE_BG="be3841"
A_WM_ICON_CLOSE_BG="2f343f"
A_WM_BUTTON_HOVER_BG="454c5c"
A_WM_BUTTON_ACTIVE_BG="$A_SELECTED_BG"
A_WM_BUTTON_HOVER_BORDER="262932"
A_WM_ICON_BG="90939b"
A_WM_ICON_UNFOCUSED_BG="666a74"
A_WM_ICON_HOVER_BG="c4c7cc"
A_WM_ICON_ACTIVE_BG="$A_SELECTED_FG"
A_WINDOW_BG="353945"
A_DARK_SIDEBAR_FG="bac3cf"
A_ENTRY_BORDER="cfd6e6"
## SVG
A_BLUE="5294e2" # Duplicate of $A_SELECTED_BG
A_WHITE="f9fafb"
A_GREY="e7e8eb"
A_DARK="383c4a" # Duplicate of $A_BG
A_DARKEST="2f343f" # Duplicate of $A_WM_ICON_CLOSE_BG
A_DARKEST2="2f343d"
A_DARK_BUTTON="353a47"
A_LIGHT_BUTTON="2d323f"
A_OTHER_LIGHT_BUTTON="444a58"
A_MODAL="323644"
A_ASSET_DARK="2e3340"
A_ASSET_DARK2="313541"
A_ASSET_GREY="bebebe"
A_ASSET_BORDER="2c303a"
A_ASSET_LIGHTER_BG="3e4350"
A_ASSET_LIGHTER_BG_FIX="3e4351" # This seems to be an upstream bug
A_ASSET_VARIOUS_DARK1="262934"
A_ASSET_VARIOUS_DARK2="2d303b"
A_ASSET_VARIOUS_DARK3="2d323d"
A_GNOME_PANEL_BG="252a35"
A_GNOME_PANEL_BORDER="0f1116"
A_GTK2_TOOLBAR="70788d"
A_GTK2_TOOLBAR_DARK="afb8c5"
A_CLOSE_BUTTON_GREY="f8f8f9"
A_LIGHT_BG="f5f6f7"
## GTK2
A_GTK2_SENSITIVE_STROKE="2b2e39"
A_GTK2_INSENSITIVE_FG_COLOR="7c818c"
A_GTK2_INSENSITIVE_STROKE="303440"

# Solarized colors
## Common
S_YELLOW="b58900"
S_ORANGE="cb4b16"
S_RED="dc322f"
S_MAGENTA="d33682"
S_VIOLET="6c71c4"
S_BLUE="268bd2"
S_CYAN="2aa198"
S_GREEN="859900"
## Dark
S_BASE03="002b36"
S_BASE02="073642"
S_BASE01="586e75"
S_BASE00="657b83"
S_BASE0="839496"
S_BASE1="93a1a1"
S_BASE2="eee8d5"
S_BASE3="fdf6e3"

FILETYPES=('scss' 'svg' 'xpm' 'xml' 'rc')
declare -A REPLACE
REPLACE[$A_BASE]=$S_BASE03
REPLACE[$A_TEXT]=$S_BASE0
REPLACE[$A_BG]=$S_BASE02
REPLACE[$A_FG]=$S_BASE0
REPLACE[$A_SELECTED_FG]=$S_BASE3
REPLACE[$A_SELECTED_BG]=$S_BLUE
REPLACE[$A_WARNING]=$S_ORANGE
REPLACE[$A_ERROR]=$S_RED
REPLACE[$A_SUCCESS]=$S_GREEN
REPLACE[$A_DESTRUCTIVE]=$S_RED
REPLACE[$A_SUGGESTED]=$S_CYAN
REPLACE[$A_DROP_TARGET]=$S_YELLOW
REPLACE[$A_WM_BUTTON_CLOSE_BG]=$S_RED
REPLACE[$A_WM_BUTTON_CLOSE_HOVER_BG]=$S_ORANGE
REPLACE[$A_WM_BUTTON_CLOSE_ACTIVE_BG]=$S_RED
REPLACE[$A_WM_ICON_CLOSE_BG]=$S_BASE03
REPLACE[$A_WM_BUTTON_HOVER_BG]=$S_BASE00
REPLACE[$A_WM_BUTTON_ACTIVE_BG]=$S_BLUE
REPLACE[$A_WM_BUTTON_HOVER_BORDER]=$S_BASE03
REPLACE[$A_WM_ICON_BG]=$S_BASE1
REPLACE[$A_WM_ICON_UNFOCUSED_BG]=$S_BASE00
REPLACE[$A_WM_ICON_HOVER_BG]=$S_BASE1
REPLACE[$A_WM_ICON_ACTIVE_BG]=$S_BASE3
REPLACE[$A_WINDOW_BG]=$S_BASE02
REPLACE[$A_DARK_SIDEBAR_FG]=$S_BASE00
REPLACE[$A_ENTRY_BORDER]=$S_BASE00
REPLACE[$A_WHITE]=$S_BASE3
REPLACE[$A_GREY]=$S_BASE2
REPLACE[$A_DARKEST2]=$S_BASE03
REPLACE[$A_DARK_BUTTON]=$S_BASE03
REPLACE[$A_LIGHT_BUTTON]=$S_BASE02
REPLACE[$A_MODAL]=$S_BASE03
REPLACE[$A_ASSET_DARK]=$S_BASE03
REPLACE[$A_ASSET_DARK2]=$S_BASE02
REPLACE[$A_ASSET_GREY]=$S_BASE00
REPLACE[$A_ASSET_BORDER]=$S_BASE00
REPLACE[$A_ASSET_VARIOUS_DARK1]=$S_BASE00
REPLACE[$A_ASSET_VARIOUS_DARK2]=$S_BASE03
REPLACE[$A_ASSET_VARIOUS_DARK3]=$S_BASE03
REPLACE[$A_GNOME_PANEL_BG]=$S_BASE03
REPLACE[$A_GNOME_PANEL_BORDER]=$S_BASE03
REPLACE[$A_GTK2_TOOLBAR]=$S_BASE0
REPLACE[$A_GTK2_TOOLBAR_DARK]=$S_BASE00
REPLACE[$A_CLOSE_BUTTON_GREY]=$S_BASE02
REPLACE[$A_LIGHT_BG]=$S_BASE2
REPLACE[$A_GTK2_INSENSITIVE_FG_COLOR]=$S_BASE01
# GTK2 tweaks
REPLACE[$A_ASSET_LIGHTER_BG]="033441"
REPLACE[$A_ASSET_LIGHTER_BG_FIX]="033441"
REPLACE[$A_OTHER_LIGHT_BUTTON]="003340"
REPLACE[$A_GTK2_SENSITIVE_STROKE]="041f26"
REPLACE[$A_GTK2_INSENSITIVE_STROKE]="052932"

CWD="`pwd`/arc-theme-${ARCVERSION}"
cd "${CWD}"

echo "### Replacing arc colors with solarized colors"
for filetype in "${FILETYPES[@]}"
do
    echo "## Replacing in ${filetype}"
    for K in ${!REPLACE[@]}
    do
        find . -name "*.${filetype}" -exec sed -i "s/${K}/${REPLACE[$K]}/Ig" {} \;
    done
done
echo "## Replacing in gtk-2.0 rc"
for K in ${!REPLACE[@]}
do
    find . -type f -name "gtkrc*" -exec sed -i "s/${K}/${REPLACE[$K]}/Ig" {} \;
done

echo ""
echo "### Regenerating assets"
ASSET_FOLDERS=("gtk-2.0" "gtk-3.0/${GTK3VER}" "xfwm4") # NOTE: Skipping old gtk3 versions for build time
echo "## Deleting old assets"

for folder in "${ASSET_FOLDERS[@]}"
do
    rm -f common/${folder}/assets/*.png
done
rm -f common/gtk-2.0/assets-dark/*.png
rm -f common/gtk-2.0/menubar-toolbar/*.png
rm -f common/xfwm4/assets-dark/*.png

echo "## Writing new assets"
for folder in "${ASSET_FOLDERS[@]}"
do
    echo "# Writing assets for ${folder}"
    cd common/${folder}
    ./render-assets.sh > /dev/null
    cd "${CWD}"
done

echo "# Copying assets for gtk-2.0 menubar and toolbar"
cp common/gtk-2.0/assets-dark/button.png common/gtk-2.0/menubar-toolbar/button.png
cp common/gtk-2.0/assets-dark/button-hover.png common/gtk-2.0/menubar-toolbar/button-hover.png
cp common/gtk-2.0/assets-dark/button-active.png common/gtk-2.0/menubar-toolbar/button-active.png
cp common/gtk-2.0/assets-dark/button-insensitive.png common/gtk-2.0/menubar-toolbar/button-insensitive.png
cp common/gtk-2.0/assets/entry-toolbar.png common/gtk-2.0/menubar-toolbar/entry-toolbar.png
cp common/gtk-2.0/assets/entry-active-toolbar.png common/gtk-2.0/menubar-toolbar/entry-active-toolbar.png
cp common/gtk-2.0/assets/entry-disabled-toolbar.png common/gtk-2.0/menubar-toolbar/entry-disabled-toolbar.png
cp common/gtk-2.0/assets-dark/entry-toolbar.png common/gtk-2.0/menubar-toolbar/entry-toolbar-dark.png
cp common/gtk-2.0/assets-dark/entry-active-toolbar.png common/gtk-2.0/menubar-toolbar/entry-active-toolbar-dark.png
cp common/gtk-2.0/assets-dark/entry-disabled-toolbar.png common/gtk-2.0/menubar-toolbar/entry-disabled-toolbar-dark.png
cp common/gtk-2.0/assets/menubar.png common/gtk-2.0/menubar-toolbar/menubar.png
cp common/gtk-2.0/assets-dark/menubar.png common/gtk-2.0/menubar-toolbar/menubar-dark.png
cp common/gtk-2.0/assets/menubar_button.png common/gtk-2.0/menubar-toolbar/menubar_button.png
cp common/gtk-2.0/assets-dark/menubar_button.png common/gtk-2.0/menubar-toolbar/menubar_button-dark.png

# Correct index.theme metadata & output directories
for PATTERN in "Makefile.am" "index.theme*" "metacity-theme-*.xml"; do
    find "${CWD}/common" -name "${PATTERN}" -exec sed -i "s/Arc/SolArc/g" {} \;
done
sed -i "s/Arc/SolArc/g" configure.ac;

npm install gulp gulp-sass gulp-rename # NOTE: gulp below requires these node modules

echo "### Regenerating css"
gulp

# Configure, installing to build dir
./autogen.sh "${AUTOGENFLAGS}"

# Make & install to build dir for packaging, etc.
make install

