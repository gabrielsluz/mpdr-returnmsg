reset
n=151 #number of intervals
max=150. #max value
min=0. #min value
width=(max-min)/n #interval width
total = 5700
#function used to map a value to the intervals
hist(x,width)=width*floor(x/width)+width/2.0
set term png #output terminal and file
set output "CustoCadaCaminhoN.png"
set xrange [min:max]
set yrange [0:1.01]
#to put an empty boundary around the
#data inside an autoscaled graph.
set offset graph 0.05,0.05,0.05,0.0
set xtics min,(max-min)/5,max
set boxwidth width*0.9
set style fill solid 0.5 #fillstyle
set tics out nomirror
set xlabel "Custo dos Caminhos para o Dois Caminhos"
set ylabel "CDF"
set key right bottom 
set style line 2 lt "dashed" lc "red" lw 5 pt 0.2
set style line 3 lt 3 lw 3 pt 0.2
set style line 1 lt 2 lw 3 pt 0.2

set tics font "Arial-Bold,16"
set terminal pngcairo size 720, 480 font "Arial-Bold,16"

#count and plot
plot "Caminho1N.txt" u (hist($1,width)):(1.0/total) smooth cumulative title "Caminho 1" with linespoints ls 3, \
 "Caminho2N.txt" u (hist($1,width)):(1.0/total) smooth cumulative title "Caminho 2" with linespoints ls 2;
	
