reset
n=9 #number of intervals
max=9. #max value
min=0. #min value
width=1

set term png #output terminal and file
set output "GraficoDeliveryRateWithCCAWithAck.png"
set xrange [min:max]
set yrange [0:1]

set xlabel "Distance"
set ylabel "Delivery Rate"
set key right bottom 

plot "datafileDeliveryRateN.dat" using 1:2  title "Dois Caminhos" with lines lt 1, "" using 1:2:3:4 with yerrorbars lt 1, \
 "datafileDeliveryRateNS.dat" using 1:2  title "Minimiza Latencia" with lines lt 2, "" using 1:2:3:4 with yerrorbars lt 2,
