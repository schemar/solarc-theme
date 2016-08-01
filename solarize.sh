#!/bin/bash

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
A_BLUE="5294e2"
A_WHITE="f9fafb"
A_GREY="e7e8eb"
A_DARK="383c4a"
A_DARKEST="2f343f"
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
A_ASSET_VARIOUS_DARK1="262934"
A_ASSET_VARIOUS_DARK2="2d303b"
A_ASSET_VARIOUS_DARK3="2d323d"

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
ARC_COLORS=(      "$A_BASE"   "$A_TEXT"   "$A_BG"     "$A_FG"     "$A_SELECTED_FG" "$A_SELECTED_BG" "$A_WARNING" "$A_ERROR" "$A_SUCCESS" "$A_DESTRUCTIVE" "$A_SUGGESTED" "$A_DROP_TARGET" "$A_WM_BUTTON_CLOSE_BG" "$A_WM_BUTTON_CLOSE_HOVER_BG" "$A_WM_BUTTON_CLOSE_ACTIVE_BG" "$A_WM_ICON_CLOSE_BG" "$A_WM_BUTTON_HOVER_BG" "$A_WM_BUTTON_ACTIVE_BG" "$A_WM_BUTTON_HOVER_BORDER" "$A_WM_ICON_BG" "$A_WM_ICON_UNFOCUSED_BG" "$A_WM_ICON_HOVER_BG" "$A_WM_ICON_ACTIVE_BG" "$A_WINDOW_BG" "$A_DARK_SIDEBAR_FG" "$A_ENTRY_BORDER" "$A_BLUE" "$A_WHITE" "$A_GREY"  "$A_DARK"   "$A_DARKEST" "$A_DARKEST2" "$A_DARK_BUTTON" "$A_LIGHT_BUTTON" "$A_OTHER_LIGHT_BUTTON" "$A_MODAL"  "$A_ASSET_DARK" "$A_ASSET_DARK2" "$A_ASSET_GREY" "$A_ASSET_BORDER" "$A_ASSET_LIGHTER_BG" "$A_ASSET_VARIOUS_DARK1" "$A_ASSET_VARIOUS_DARK2" "$A_ASSET_VARIOUS_DARK3")
SOLARIZED_COLORS=("$S_BASE02" "$S_BASE00" "$S_BASE03" "$S_BASE00" "$S_BASE3"       "$S_BLUE"        "$S_ORANGE"  "$S_RED"   "$S_GREEN"   "$S_RED"          "$S_CYAN"     "$S_YELLOW"      "$S_RED"                "$S_ORANGE"                   "$S_RED"                       "$S_BASE03"           "$S_BASE00"             "$S_BLUE"                "$S_BASE03"                 "$S_BASE1"      "$S_BASE00"               "$S_BASE1"            "$S_BASE3"             "$S_BASE02"    "$S_BASE00"          "$S_BASE00"       "$S_BLUE" "$S_BASE3" "$S_BASE2" "$S_BASE03" "$S_BASE03"  "$S_BASE03"   "$S_BASE03"      "$S_BASE02"       "$S_BASE02"             "$S_BASE03" "$S_BASE03"     "$S_BASE02"      "$S_BASE00"     "$S_BASE00"       "$S_BASE02"           "$S_BASE00"              "$S_BASE03"              "$S_BASE03"             )

CWD=`pwd`

echo "### Replacing arc colors with solarized colors"
for filetype in "${FILETYPES[@]}"
do
    echo "## Replacing in ${filetype}"
    for index in ${!ARC_COLORS[*]}
    do
        find . -name "*.${filetype}" -exec sed -i "s/${ARC_COLORS[$index]}/${SOLARIZED_COLORS[$index]}/Ig" {} \;
    done
done
echo "## Replacing in gtk-2.0 rc"
for index in ${!ARC_COLORS[*]}
do
    find . -type f -name "gtkrc*" -exec sed -i "s/${ARC_COLORS[$index]}/${SOLARIZED_COLORS[$index]}/Ig" {} \;
done

echo ""
echo "### Regenerating assets"
ASSET_FOLDERS=("gtk-2.0" "gtk-3.0/3.14" "gtk-3.0/3.16" "gtk-3.0/3.18" "gtk-3.0/3.20")
echo "## Deleting old assets"
cd "${CWD}"
for folder in "${ASSET_FOLDERS[@]}"
do
    rm -f common/${folder}/assets/*.png
done
rm -f common/gtk-2.0/assets-dark/*.png

echo "## Writing new assets"
for folder in "${ASSET_FOLDERS[@]}"
do
    echo "# Writing assets for ${folder}"
    cd common/${folder}
    ./render-assets.sh > /dev/null
    cd "${CWD}"
done

echo "# Writing assets for gtk-2.0 dark"
cd common/gtk-2.0
./render-dark-assets.sh > /dev/null
cd "${CWD}"

echo "### Regenerating css"
gulp
