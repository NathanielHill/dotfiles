# enable macros
set macros

# search for functions or data files in these directories
set loadpath '/usr/local/lib/gnuplot'

# Default grid style
set grid back ls 0

# add default line colors
set linetype 1 lc rgb 'blue' lw 2 pt 5 ps 0.5           # blue
set linetype 2 lc rgb 'forest-green' lw 1 pt 7 ps 0.5   # green
set linetype 3 lc rgb 'red' lw 1 pt 7 ps 0.5            # red

# add macros to select the desired line style
BLUE = "1"
GREEN = "2"
RED = "3"

# add macros to select a desired terminal
WXT = "set terminal wxt size 350,262 enhanced font 'Verdana,10' persist"
PNG = "set terminal pngcairo size 350,262 enhanced font 'Verdana,10'"
SVG = "set terminal svg size 350,262 fname 'Verdana, Helvetica, Arial, sans-serif' fsize = 10"
EPS = "set terminal epslatex color colortext"
