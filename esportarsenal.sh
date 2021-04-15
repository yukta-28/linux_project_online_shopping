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

function Subheader
{
echo "Your current tournament PC"
if [[ ${Part_name_array[0]} != "" ]]
then
echo "1. CPU: ${Part_name_array[0]}, \$${Part_cost_array[0]}"
fi
if [[ ${Part_name_array[1]} != "" ]]
then
echo "2. MOBO: ${Part_name_array[1]}, \$${Part_cost_array[1]}"
fi
if [[ ${Part_name_array[2]} != "" ]]
then
echo "3. GPU: ${Part_name_array[2]}, \$${Part_cost_array[2]}"
fi
if [[ ${Part_name_array[3]} != "" ]]
then
echo "4. RAM: ${Part_name_array[3]}, \$${Part_cost_array[3]}"
fi
if [[ ${Part_name_array[4]} != "" ]]
then
echo "5. PSU: ${Part_name_array[4]}, \$${Part_cost_array[4]}"
fi
if [[ ${Part_name_array[5]} != "" ]]
then
echo "6. Case: ${Part_name_array[5]}, \$${Part_cost_array[5]}"
fi
if [[ ${Part_name_array[6]} != "" ]]
then
echo "7. SSD: ${Part_name_array[6]}, \$${Part_cost_array[6]}"
fi
if [[ ${Part_name_array[7]} != "" ]]
then
echo "8. OS: ${Part_name_array[7]}, \$${Part_cost_array[7]}"
fi
#Cart_total=0
((Cart_total=${Part_cost_array[0]}+${Part_cost_array[1]}+${Part_cost_array[2]}+${Part_cost_array[3]}+${Part_cost_array[4]}+${Part_cost_array[5]}+${Part_cost_array[6]}+${Part_cost_array[7]}))
echo "Total price: \$$Cart_total"
echo ""
return $Cart_total
}

function Choose
{
while [[ ${Part_name_array[0]} == "" || ${Part_name_array[1]} == "" || ${Part_name_array[2]} == "" || ${Part_name_array[3]} == "" || ${Part_name_array[4]} == "" || ${Part_name_array[5]} == "" || ${Part_name_array[6]} == "" || ${Part_name_array[7]} == "" ]]
do
echo "1. Processor"
echo "2. Motherboard"
echo "3. Graphics card"
echo "4. RAM"
echo "5. Power supply"
echo "6. Case"
echo "7. Solid State Drive"
echo "8. Operating System"
read -p "Select a category: " Category
((Category=Category-1))
./esportarsenalheader.sh
Subheader

#Use for loop
if [[ $Category = 0 ]]
then
while [[ $Indexer != 0 && $Indexer != 1 && $Indexer != 2 && $Indexer != 3 ]]
do
./esportarsenalheader.sh
Subheader
echo "1. ${CPU[0]}, \$${CPU_cost[0]}"
echo "2. ${CPU[1]}, \$${CPU_cost[1]}"
echo "3. ${CPU[2]}, \$${CPU_cost[2]}"
echo "4. ${CPU[3]}, \$${CPU_cost[3]}"
read -p "Choose your processor: " Indexer
((Indexer=Indexer-1))
Part_name_array[Category]=${CPU[Indexer]}
Part_cost_array[Category]=${CPU_cost[Indexer]}
./esportarsenalheader.sh
Subheader
done
fi
Indexer=9

if [[ $Category = 1 ]]
then
while [[ $Indexer != 0 && $Indexer != 1 && $Indexer != 2 && $Indexer != 3 ]]
do
./esportarsenalheader.sh
Subheader
echo "0. ${Mobo[0]}, \$${Mobo_cost[0]}"
echo "1. ${Mobo[1]}, \$${Mobo_cost[1]}"
echo "2. ${Mobo[2]}, \$${Mobo_cost[2]}"
echo "3. ${Mobo[3]}, \$${Mobo_cost[3]}"
read -p "Choose your motherboard: " Indexer
((Indexer=Indexer-1))
Part_name_array[Category]=${Mobo[Indexer]}
Part_cost_array[Category]=${Mobo_cost[Indexer]}
done
fi
Indexer=9

if [[ $Category = 2 ]]
then
while [[ $Indexer != 0 && $Indexer != 1 && $Indexer != 2 && $Indexer != 3 ]]
do
./esportarsenalheader.sh
Subheader
echo "0. ${GPU[0]}, \$${GPU_cost[0]}"
echo "1. ${GPU[1]}, \$${GPU_cost[1]}"
echo "2. ${GPU[2]}, \$${GPU_cost[2]}"
echo "3. ${GPU[3]}, \$${GPU_cost[3]}"
read -p "Choose your motherboard: " Indexer
((Indexer=Indexer-1))
Part_name_array[Category]=${GPU[Indexer]}
Part_cost_array[Category]=${GPU_cost[Indexer]}
done
fi
Indexer=9

if [[ $Category = 3 ]]
then
while [[ $Indexer != 0 && $Indexer != 1 && $Indexer != 2 && $Indexer != 3 ]]
do
./esportarsenalheader.sh
Subheader
echo "0. ${RAM[0]}, \$${RAM_cost[0]}"
echo "1. ${RAM[1]}, \$${RAM_cost[1]}"
echo "2. ${RAM[2]}, \$${RAM_cost[2]}"
echo "3. ${RAM[3]}, \$${RAM_cost[3]}"
read -p "Choose your motherboard: " Indexer
((Indexer=Indexer-1))
Part_name_array[Category]=${RAM[Indexer]}
Part_cost_array[Category]=${RAM_cost[Indexer]}
done
fi
Indexer=9

if [[ $Category = 4 ]]
then
while [[ $Indexer != 0 && $Indexer != 1 && $Indexer != 2 && $Indexer != 3 ]]
do
./esportarsenalheader.sh
Subheader
echo "0. ${PSU[0]}, \$${PSU_cost[0]}"
echo "1. ${PSU[1]}, \$${PSU_cost[1]}"
echo "2. ${PSU[2]}, \$${PSU_cost[2]}"
echo "3. ${PSU[3]}, \$${PSU_cost[3]}"
read -p "Choose your motherboard: " Indexer
((Indexer=Indexer-1))
Part_name_array[Category]=${PSU[Indexer]}
Part_cost_array[Category]=${PSU_cost[Indexer]}
done
fi
Indexer=9

if [[ $Category = 5 ]]
then
while [[ $Indexer != 0 && $Indexer != 1 && $Indexer != 2 && $Indexer != 3 ]]
do
./esportarsenalheader.sh
Subheader
echo "0. ${Case[0]}, \$${Case_cost[0]}"
echo "1. ${Case[1]}, \$${Case_cost[1]}"
echo "2. ${Case[2]}, \$${Case_cost[2]}"
echo "3. ${Case[3]}, \$${Case_cost[3]}"
read -p "Choose your motherboard: " Indexer
((Indexer=Indexer-1))
Part_name_array[Category]=${Case[Indexer]}
Part_cost_array[Category]=${Case_cost[Indexer]}
done
fi
Indexer=9

if [[ $Category = 6 ]]
then
while [[ $Indexer != 0 && $Indexer != 1 && $Indexer != 2 && $Indexer != 3 ]]
do
./esportarsenalheader.sh
Subheader
echo "0. ${SSD[0]}, \$${SSD_cost[0]}"
echo "1. ${SSD[1]}, \$${SSD_cost[1]}"
echo "2. ${SSD[2]}, \$${SSD_cost[2]}"
echo "3. ${SSD[3]}, \$${SSD_cost[3]}"
read -p "Choose your motherboard: " Indexer
((Indexer=Indexer-1))
Part_name_array[Category]=${SSD[Indexer]}
Part_cost_array[Category]=${SSD_cost[Indexer]}
done
fi
Indexer=9

if [[ $Category = 7 ]]
then
while [[ $Indexer != 0 && $Indexer != 1 && $Indexer != 2 && $Indexer != 3 ]]
do
./esportarsenalheader.sh
Subheader
echo "0. ${OS[0]}, \$${OS_cost[0]}"
echo "1. ${OS[1]}, \$${OS_cost[1]}"
echo "2. ${OS[2]}, \$${OS_cost[2]}"
echo "3. ${OS[3]}, \$${OS_cost[3]}"
read -p "Choose your motherboard: " Indexer
((Indexer=Indexer-1))
Part_name_array[Category]=${OS[Indexer]}
Part_cost_array[Category]=${OS_cost[Indexer]}
done
fi
Indexer=9

./esportarsenalheader.sh
Subheader
done
}

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
