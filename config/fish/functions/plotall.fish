function plotall

switch (count $argv)
case 0
    echo "Please tell me what file extension to plot!"
case 1
    command gnuplot -e "plot for [file in system('ls *.$argv[1]')] file title file; pause -1"
case 2
    command gnuplot -e "set xrange [$argv[2]:*]; plot for [file in system('ls *.$argv[1]')] file title file; pause -1"
case 3
    command gnuplot -e "set xrange [$argv[2]:$argv[3]]; plot for [file in system('ls *.$argv[1]')] file title file; pause -1"
case 4
    command gnuplot -e "set xrange [$argv[2]:$argv[3]]; set yrange[$argv[4]:*]; plot for [file in system('ls *.$argv[1]')] file title file; pause -1"
case 5
    command gnuplot -e "set xrange [$argv[2]:$argv[3]]; set yrange[$argv[4]:$argv[5]]; plot for [file in system('ls *.$argv[1]')] file title file; pause -1"
case '*'
    echo "I don't know what you want! Too many arguments."
end


end
