reset
n=10 #number of intervals
max=100. #max value
min=0. #min value
width=1

set term png #output terminal and file
set output "GraficoLatencyTopologyWithCCAWithAck.png"
set xrange [min:max]
set yrange [0:300]

set xlabel "Distance"
set ylabel "Latency (ms)"
set key right bottom 


plot "datafileLatencyTopologyN.dat" using 1:2  title "Dois Caminhos" with lines lt 1, "" using 1:2:3:4 with yerrorbars lt 1, \
 "datafileLatencyTopologyNS.dat" using 1:2  title "Minimiza Latencia" with lines lt 2, "" using 1:2:3:4 with yerrorbars lt 2,
