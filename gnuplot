# enable macros
set macros

# search for functions or data files in these directories
set loadpath '/usr/local/lib/gnuplot'

# Default grid style
set grid back ls 0

# add default line colors
set linetype 1 lc rgb 'orange'  lw 2 pt 7 ps 0.5          # orange
set linetype 2 lc rgb 'red'     lw 1 pt 7 ps 0.5          # red
set linetype 3 lc rgb 'blue'    lw 1 pt 7 ps 0.5          # blue
set linetype 4 lc rgb 'yellow'  lw 1 pt 7 ps 0.5          # yellow
set linetype 5 lc rgb 'green'   lw 1 pt 7 ps 0.5          # green
set linetype 6 lc rgb 'purple'  lw 1 pt 7 ps 0.5          # purple
set linetype 7 lc rgb 'blue'    lw 1 pt 7 ps 0.5          # blue
set linetype 8 lc rgb 'blue'    lw 1 pt 7 ps 0.5          # blue

# add macros to select the desired line style
ORANGE= "1"
RED = "2"
BLUE = "3"
YELLOW = "4"
GREEN = "5"
PURPLE = "6"
BLUE = "7"


# add macros to select a desired terminal
WXT = "set terminal wxt size 350,262 enhanced font 'Verdana,10' persist"
PNG = "set terminal pngcairo size 350,262 enhanced font 'Verdana,10'"
SVG = "set terminal svg size 350,262 fname 'Verdana, Helvetica, Arial, sans-serif' fsize = 10"
EPS = "set terminal epslatex color colortext"
