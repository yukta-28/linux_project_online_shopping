Part_name_array=("" "" "" "" "" "" "" "")
Part_cost_array=(0 0 0 0 0 0 0 0)

i=0
while IFS="," read -r rec_column1 rec_column2
do
CPU[i]=$rec_column1
CPU_cost[i]=$rec_column2
((i=i+1))
done < CPU.csv

i=0
while IFS="," read -r rec_column1 rec_column2
do
Mobo[i]=$rec_column1
Mobo_cost[i]=$rec_column2
((i=i+1))
done < Mobo.csv

i=0
while IFS="," read -r rec_column1 rec_column2
do
GPU[i]=$rec_column1
GPU_cost[i]=$rec_column2
((i=i+1))
done < GPU.csv

i=0
while IFS="," read -r rec_column1 rec_column2
do
RAM[i]=$rec_column1
RAM_cost[i]=$rec_column2
((i=i+1))
done < RAM.csv

i=0
while IFS="," read -r rec_column1 rec_column2
do
PSU[i]=$rec_column1
PSU_cost[i]=$rec_column2
((i=i+1))
done < PSU.csv

i=0
while IFS="," read -r rec_column1 rec_column2
do
Case[i]=$rec_column1
Case_cost[i]=$rec_column2
((i=i+1))
done < Case.csv

i=0
while IFS="," read -r rec_column1 rec_column2
do
SSD[i]=$rec_column1
SSD_cost[i]=$rec_column2
((i=i+1))
done < SSD.csv

i=0
while IFS="," read -r rec_column1 rec_column2
do
OS[i]=$rec_column1
OS_cost[i]=$rec_column2
((i=i+1))
done < OS.csv
