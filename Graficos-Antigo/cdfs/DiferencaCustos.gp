reset
n=61 #number of intervals
max=150. #max value
min=0. #min value
width=(max-min)/n #interval width
total = 5700
#function used to map a value to the intervals
hist(x,width)=width*floor(x/width)+width/2.0
set term png #output terminal and file
set output "DiferencaCustos.png"
set xrange [min:max]
set yrange [0:1.01]
#to put an empty boundary around the
#data inside an autoscaled graph.
set offset graph 0.05,0.05,0.05,0.0
set xtics min,(max-min)/5,max
set boxwidth width*0.9
set style fill solid 0.5 #fillstyle
set tics out nomirror
set xlabel "Diferença entre o custo dos dois caminhos"
set ylabel "CDF"
set key right bottom 

 set style line 1 lt 7 lw 2 pt 6 ps 3


 set style line 2 lt "dashed" lc "red" lw 5 pt 4 ps 3


 set style line 3 lt 3 lw 2 pt 8 ps 3

set tics font "Arial-Bold,16"
set terminal pngcairo size 720, 480 font "Arial-Bold,16"

#count and plot
plot "difCusto.txt" u (hist($1,width)):(1.0/total) smooth cumulative title "Dois Caminhos" with linespoints ls 3, \
 "difCustoM.txt" u (hist($1,width)):(1.0/total) smooth cumulative title "Minimiza Latência" with linespoints ls 2;
	
