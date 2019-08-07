set terminal png size 680,480 font "Arial-Bold,18"
set tics font "Arial-Bold,18"
set xlabel '1/Custo do maior caminho'
set ylabel 'Vazão (kBps)'
set xrange [0:0.04]
set yrange [0:70]
#set key bottom Right
set style line 1 lc rgb 'red' pt 5   # square
plot 'thrxlatencia.dat' using (1/$1):3:5 with labels point pt 5 offset 5, .8 title '', \
'thrxlatencia2.dat' using (1/$1):3:5 with labels point pt 7 offset -4, -.8 title '', \
'thrxlatencia3.dat' using (1/$1):3:5 with labels point pt 9 offset 0, .8 title ''	
set output 'thrxlatenciaf.png'
replot
