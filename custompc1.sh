#!/bin/bash
./custompc1header.sh

declare -a CPU
declare -a Mobo
declare -a GPU
declare -a RAM
declare -a PSU
declare -a Case
declare -a SSD
declare -a OS
declare -a CPU_cost
declare -a MOBO_cost
declare -a GPU_cost
declare -a RAM_cost
declare -a PSU_cost
declare -a Case_cost
declare -a SSD_cost
declare -a OS_cost
declare -a Part_name_array
declare -a Part_cost_array
Part_name_array=("" "" "" "" "" "" "" "")
Part_cost_array=(0 0 0 0 0 0 0 0)

#declare -a 

i=0
while IFS="," read -r rec_column1 rec_column2
do
#echo $i
#echo "Name: $rec_column1"
CPU[i]=$rec_column1
#echo "${CPU[i]}"
#echo "Price: $rec_column2"
CPU_cost[i]=$rec_column2
#echo "${CPU_cost[i]}"
#echo ""
((i=i+1))
done < CPU.csv
#echo ${CPU[*]}
#echo ${CPU_cost[*]}
#echo ""

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

#echo "${Part_name_array}"
#echo "${Part_cost_array}"

function Subheader
{
echo "Your current tournament PC"
if [[ ${Part_name_array[0]} != "" ]]
then
echo "0. CPU: ${Part_name_array[0]}, \$${Part_cost_array[0]}"
fi
if [[ ${Part_name_array[1]} != "" ]]
then
echo "1. MOBO: ${Part_name_array[1]}, \$${Part_cost_array[1]}"
fi
if [[ ${Part_name_array[2]} != "" ]]
then
echo "2. GPU: ${Part_name_array[2]}, \$${Part_cost_array[2]}"
fi
if [[ ${Part_name_array[3]} != "" ]]
then
echo "3. RAM: ${Part_name_array[3]}, \$${Part_cost_array[3]}"
fi
if [[ ${Part_name_array[4]} != "" ]]
then
echo "4. PSU: ${Part_name_array[4]}, \$${Part_cost_array[4]}"
fi
if [[ ${Part_name_array[5]} != "" ]]
then
echo "5. Case: ${Part_name_array[5]}, \$${Part_cost_array[5]}"
fi
if [[ ${Part_name_array[6]} != "" ]]
then
echo "6. SSD: ${Part_name_array[6]}, \$${Part_cost_array[6]}"
fi
if [[ ${Part_name_array[7]} != "" ]]
then
echo "7. OS: ${Part_name_array[7]}, \$${Part_cost_array[7]}"
fi
Cart_total=0
((Cart_total=$Cart_total+${Part_cost_array[0]}+${Part_cost_array[1]}+${Part_cost_array[2]}+${Part_cost_array[3]}+${Part_cost_array[4]}+${Part_cost_array[5]}+${Part_cost_array[6]}+${Part_cost_array[7]}))
echo "Total price: \$$Cart_total"
echo ""
return $Cart_total
}

function Choose
{
while [[ ${Part_name_array[0]} == "" || ${Part_name_array[1]} == "" || ${Part_name_array[2]} == "" || ${Part_name_array[3]} == "" || ${Part_name_array[4]} == "" || ${Part_name_array[5]} == "" || ${Part_name_array[6]} == "" || ${Part_name_array[7]} == "" ]]
do
echo "0. Processor"
echo "1. Motherboard"
echo "2. Graphics card"
echo "3. RAM"
echo "4. Power supply"
echo "5. Case"
echo "6. Solid State Drive"
echo "7. Operating System"
read -p "Select a category: " Category
./custompc1header.sh
Subheader

if [[ $Category = 0 ]]
then
while [[ $Indexer != 0 && $Indexer != 1 && $Indexer != 2 && $Indexer != 3 ]]
do
echo "0. ${CPU[0]}"
echo "1. ${CPU[1]}"
echo "2. ${CPU[2]}"
echo "3. ${CPU[3]}"
read -p "Choose your processor: " Indexer
echo $Indexer
Part_name_array[Category]=${CPU[Indexer]}
Part_cost_array[Category]=${CPU_cost[Indexer]}
echo ${Part_name_array[Indexer]}
echo ${Part_cost_array[Indexer]}
./custompc1header.sh
Subheader
done
fi
Indexer=9

if [[ $Category = 1 ]]
then
while [[ $Indexer != 0 && $Indexer != 1 && $Indexer != 2 && $Indexer != 3 ]]
do
echo "0. ${Mobo[0]}"
echo "1. ${Mobo[1]}"
echo "2. ${Mobo[2]}"
echo "3. ${Mobo[3]}"
read -p "Choose your motherboard: " Indexer
Part_name_array[Category]=${Mobo[Indexer]}
Part_cost_array[Category]=${Mobo_cost[Indexer]}
done
fi
Indexer=9

if [[ $Category = 2 ]]
then
while [[ $Indexer != 0 && $Indexer != 1 && $Indexer != 2 && $Indexer != 3 ]]
do
echo "0. ${GPU[0]}"
echo "1. ${GPU[1]}"
echo "2. ${GPU[2]}"
echo "3. ${GPU[3]}"
read -p "Choose your motherboard: " Indexer
Part_name_array[Category]=${GPU[Indexer]}
Part_cost_array[Category]=${GPU_cost[Indexer]}
done
fi
Indexer=9

if [[ $Category = 3 ]]
then
while [[ $Indexer != 0 && $Indexer != 1 && $Indexer != 2 && $Indexer != 3 ]]
do
echo "0. ${RAM[0]}"
echo "1. ${RAM[1]}"
echo "2. ${RAM[2]}"
echo "3. ${RAM[3]}"
read -p "Choose your motherboard: " Indexer
Part_name_array[Category]=${RAM[Indexer]}
Part_cost_array[Category]=${RAM_cost[Indexer]}
done
fi
Indexer=9

if [[ $Category = 4 ]]
then
while [[ $Indexer != 0 && $Indexer != 1 && $Indexer != 2 && $Indexer != 3 ]]
do
echo "0. ${PSU[0]}"
echo "1. ${PSU[1]}"
echo "2. ${PSU[2]}"
echo "3. ${PSU[3]}"
read -p "Choose your motherboard: " Indexer
Part_name_array[Category]=${PSU[Indexer]}
Part_cost_array[Category]=${PSU_cost[Indexer]}
done
fi
Indexer=9

if [[ $Category = 5 ]]
then
while [[ $Indexer != 0 && $Indexer != 1 && $Indexer != 2 && $Indexer != 3 ]]
do
echo "0. ${Case[0]}"
echo "1. ${Case[1]}"
echo "2. ${Case[2]}"
echo "3. ${Case[3]}"
read -p "Choose your motherboard: " Indexer
Part_name_array[Category]=${Case[Indexer]}
Part_cost_array[Category]=${Case_cost[Indexer]}
done
fi
Indexer=9

if [[ $Category = 6 ]]
then
while [[ $Indexer != 0 && $Indexer != 1 && $Indexer != 2 && $Indexer != 3 ]]
do
echo "0. ${SSD[0]}"
echo "1. ${SSD[1]}"
echo "2. ${SSD[2]}"
echo "3. ${SSD[3]}"
read -p "Choose your motherboard: " Indexer
Part_name_array[Category]=${SSD[Indexer]}
Part_cost_array[Category]=${SSD_cost[Indexer]}
done
fi
Indexer=9

if [[ $Category = 7 ]]
then
while [[ $Indexer != 0 && $Indexer != 1 && $Indexer != 2 && $Indexer != 3 ]]
do
echo "0. ${OS[0]}"
echo "1. ${OS[1]}"
echo "2. ${OS[2]}"
echo "3. ${OS[3]}"
read -p "Choose your motherboard: " Indexer
Part_name_array[Category]=${OS[Indexer]}
Part_cost_array[Category]=${OS_cost[Indexer]}
done
fi
Indexer=9

./custompc1header.sh
Subheader
done
}

Subheader
Choose

./custompc1header.sh
Subheader

Category=0
while [[ $Category != 9 ]]
do
read -p "Want to change any parts? (Enter 9 to continue to discount code entry) " Category
if [[ $Category == 0 || $Category == 1 || $Category == 2 || $Category == 3 || $Category == 4 || $Category == 5 || $Category == 6 || $Category == 7 ]]
then
Part_name_array[Category]=""
Part_cost_array[Category]=0
fi
./custompc1header.sh
Subheader
Choose
done

./custompc1header.sh
Subheader
source ./custompc1pay.sh
