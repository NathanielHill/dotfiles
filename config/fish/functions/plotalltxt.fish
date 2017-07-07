function plotalltxt
    command gnuplot -e "plot for [file in system('ls *.txt')] file title file; pause -1"
end
