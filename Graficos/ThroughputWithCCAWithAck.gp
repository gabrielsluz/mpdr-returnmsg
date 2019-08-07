reset
n=9 #number of intervals
max=9. #max value
min=0. #min value
width=1

set term png #output terminal and file
set output "GraficoThroughputWithCCAWithAck.png"
set xrange [min:max]
set yrange [0:35] 

set xlabel "Distance"
set ylabel "Throughput (KBps)"
set key right bottom 

set style line 1 lc rgb "red" pt 5 ps 1.5
set style line 2 lc rgb "blue" pt 7 ps 1.5

plot "datafileThroughputN.dat" using 1:2 title "Dois Caminhos" with linespoints ls 1 , \
     "datafileThroughputNS.dat" using 1:2 title "Minimiza Latencia" with linespoints ls 2 
