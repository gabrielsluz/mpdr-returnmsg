reset
n=151 #number of intervals
max=150. #max value
min=0. #min value
width=(max-min)/n #interval width
total = 5698
#function used to map a value to the intervals
hist(x,width)=width*floor(x/width)+width/2.0
set term png #output terminal and file
set output "CustoMaiorCaminho.png"
set xrange [min:max]
set yrange [0:1.01]
#to put an empty boundary around the
#data inside an autoscaled graph.
set offset graph 0.05,0.05,0.05,0.0
set xtics min,(max-min)/5,max
set boxwidth width*0.9
set style fill solid 0.5 #fillstyle
set tics out nomirror
set xlabel "Custo do maior caminho"
set ylabel "CDF"
set key right bottom 
set style line 2 lt "dashed" lc "red" lw 5 pt 0.2
set style line 3 lt 3 lw 3 pt 0.2
set style line 1 lt 2 lw 3 pt 0.2

set tics font "Arial-Bold,16"
set terminal pngcairo size 720, 480 font "Arial-Bold,16"

#count and plot
plot "Caminho2.txt" u (hist($1,width)):(1.0/total) smooth cumulative title "Minimiza Latência" with linespoints ls 2, \
 "Caminho2N.txt" u (hist($1,width)):(1.0/total) smooth cumulative title "Dois Caminhos" with linespoints ls 3;
	
