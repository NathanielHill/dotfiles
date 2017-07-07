function plotalldat
    command gnuplot -e "plot for [file in system('ls *.dat')] file title file; pause -1"
end
