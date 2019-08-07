#!/bin/bash


routes=routes

if [ "$routes" == "routesN" ]
then
  test=testN
  id=N
else
  test=test
  id=NS
fi

OLDIFS=$IFS
IFS=','

size=$1

for i in 100,6,17 100,6,93 100,11,58 100,36,20 100,38,53 100,43,80 100,55,26 100,76,80 100,79,63 100,90,44
do
  set -- $i
  python create_instancesL.py -f /home/twonet/Desktop/$routes/dual_$1_$2_$3.txt -s 80 -m 250 &&
  make opal &&
  mv build/opal/main.exe images/$id$1-latencia-$2-$3.exe
done


IFS=$OLDIFS

#Fix

#10 - 10,1,6 10,2,1 10,4,1 10,6,7 10,6,8 10,7,6 10,7,8 10,8,6 10,8,7 10,9,6
#20 - 20,8,18 20,11,17 20,13,12 20,14,20 20,15,16 20,15,17 20,15,18 20,17,7 20,17,11 20,19,15
#30 - 30,6,8 30,8,16 30,8,19 30,8,24 30,17,6 30,18,16 30,18,22 30,18,23 30,20,13 30,27,24
#40 - 40,12,22 40,12,34 40,14,28 40,15,19 40,15,34 40,18,21 40,22,38 40,29,17 40,31,11 40,31,24
#50 - 50,8,29 50,11,33 50,15,6 50,17,16 50,19,23 50,29,13 50,29,24 50,29,33 50,30,14 50,46,33
#60 - 60,6,37 60,6,42 60,19,27 60,21,17 60,34,19 60,34,57 60,39,17 60,44,45 60,47,59 60,48,26
#70 - 70,11,34 70,16,51 70,22,25 70,29,70 70,34,42 70,46,45 70,47,38 70,48,7 70,56,29 70,63,55
#80 - 80,7,28 80,36,25 80,40,58 80,44,73 80,46,11 80,47,41 80,48,66 80,53,41 80,60,6 80,64,6
#90 - 90,18,52 90,21,44 90,36,55 90,50,40 90,53,86 90,69,57 90,74,30 90,78,32 90,86,15 90,86,77
#100 - 100,6,17 100,6,93 100,11,58 100,36,20 100,38,53 100,43,80 100,55,26 100,76,80 100,79,63 100,90,44
