#!/bin/bash
./esportarsenalheader.sh

#declare -a CPU
#declare -a Mobo
#declare -a GPU
#declare -a RAM
#declare -a PSU
#declare -a Case
#declare -a SSD
#declare -a OS
#declare -a CPU_cost
#declare -a MOBO_cost
#declare -a GPU_cost
#declare -a RAM_cost
#declare -a PSU_cost
#declare -a Case_cost
#declare -a SSD_cost
#declare -a OS_cost
#declare -a Part_name_array
#declare -a Part_cost_array
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

source Subheader.sh
source Choose.sh

Subheader
Choose

./esportarsenalheader.sh
Subheader

#Category=0
while [[ $Category != 999 ]]
do
read -p "Want to change any parts? Enter the part category number or enter 999 to continue to discount code entry: " Category
if [[ $Category == 0 || $Category == 1 || $Category == 2 || $Category == 3 || $Category == 4 || $Category == 5 || $Category == 6 || $Category == 7 ]]
then
Part_name_array[Category]=""
Part_cost_array[Category]=0
fi
./esportarsenalheader.sh
Subheader
Choose
done

./esportarsenalheader.sh
Subheader
source ./esportarsenalship.sh
