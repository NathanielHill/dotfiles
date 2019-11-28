function plotall

switch (count $argv)
case 0
    echo "Please tell me what file extension to plot!"
case 1
    command gnuplot -e "plot for [file in system('ls *.$argv[1]')] file title file; pause -1"
case 2
    command gnuplot -e "plot for [file in system('ls *.$argv[1]')] file every ::$argv[2] title file; pause -1"
case 3
    command gnuplot -e "set xrange [$argv[3]:*]; plot for [file in system('ls *.$argv[1]')] file every ::$argv[2] title file; pause -1"
case 4
    command gnuplot -e "set xrange [$argv[3]:$argv[4]]; plot for [file in system('ls *.$argv[1]')] file every ::$argv[2] title file; pause -1"
case 5
    command gnuplot -e "set xrange [$argv[3]:$argv[4]]; set yrange[$argv[5]:*]; plot for [file in system('ls *.$argv[1]')] file every ::$argv[2] title file; pause -1"
case 6
    command gnuplot -e "set xrange [$argv[3]:$argv[4]]; set yrange[$argv[5]:$argv[6]]; plot for [file in system('ls *.$argv[1]')] file every ::$argv[2] title file; pause -1"
case '*'
    echo "I don't know what you want! Too many arguments."
end


end
