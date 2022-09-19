#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

# Available Styles
# >> Created and tested on : rofi 1.6.0-1

# launchpad.rasi            rounded-red-dark.rasi
# nord-oneline.rasi         rounded-yellow-dark.rasi
# nord-twoLines.rasi        simple-tokyonight.rasi
# nord.rasi                 spotlight-dark.rasi
# rounded-blue-dark.rasi    spotlight.rasi
# rounded-common.rasi       squared-everforest.rasi
# rounded-gray-dark.rasi    squared-material-red.rasi
# rounded-green-dark.rasi   squared-nord.rasi
# rounded-nord-dark.rasi    windows11-grid-dark.rasi
# rounded-orange-dark.rasi  windows11-grid-light.rasi
# rounded-pink-dark.rasi    windows11-list-dark.rasi
# rounded-purple-dark.rasi  windows11-list-light.rasi

theme="spotlight-dark.rasi"
dir="$HOME/.config/rofi/launchers/rofi-themes-collection"

# dark
# ALPHA="#00000000"
# BG="#000000ff"
# FG="#FFFFFFff"
# SELECT="#101010ff"

# light
#ALPHA="#00000000"
#BG="#FFFFFFff"
#FG="#000000ff"
#SELECT="#f3f3f3ff"

# accent colors
# COLORS=('#EC7875' '#61C766' '#FDD835' '#42A5F5' '#BA68C8' '#4DD0E1' '#00B19F' \
# 		'#FBC02D' '#E57C46' '#AC8476' '#6D8895' '#EC407A' '#B9C244' '#6C77BB')
# ACCENT="${COLORS[$(( $RANDOM % 14 ))]}ff"

# overwrite colors file
# cat > $dir/colors.rasi <<- EOF
# 	/* colors */

# 	* {
# 	  al:  $ALPHA;
# 	  bg:  $BG;
# 	  se:  $SELECT;
# 	  fg:  $FG;
# 	  ac:  $ACCENT;
# 	}
# EOF

# comment these lines to disable random style
# themes=($(ls -p --hide="launcher.sh" --hide="colors.rasi" $dir))
# theme="${themes[$(( $RANDOM % 12 ))]}"

rofi -no-lazy-grab -show drun -modi drun -theme $dir/"$theme"
