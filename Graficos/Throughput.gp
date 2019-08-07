reset
n=9 #number of intervals
max=9. #max value
min=0. #min value
width=1

set term png #output terminal and file
set output "GraficoThroughputNoCCANoAck.png"
set xrange [min:max]
set yrange [0:35]

set xlabel "Distance"
set ylabel "Throughput (KBps)"
set key right bottom 

plot "datafileThroughputNoCCANoAckN.dat" using 1:2  title "Dois Caminhos" with lines lt 1, "" using 1:2:3:4 with yerrorbars lt 1, \
 "datafileThroughputNoCCANoAckNS.dat" using 1:2  title "Minimiza Latencia" with lines lt 2, "" using 1:2:3:4 with yerrorbars lt 2,
