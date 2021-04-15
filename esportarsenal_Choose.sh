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
./esportarsenal_Header.sh
Subheader

#Use for loop
if [[ $Category = 0 ]]
then
while [[ $Indexer != 0 && $Indexer != 1 && $Indexer != 2 && $Indexer != 3 ]]
do
./esportarsenal_Header.sh
Subheader
echo "1. ${CPU[0]}, \$${CPU_cost[0]}"
echo "2. ${CPU[1]}, \$${CPU_cost[1]}"
echo "3. ${CPU[2]}, \$${CPU_cost[2]}"
echo "4. ${CPU[3]}, \$${CPU_cost[3]}"
read -p "Choose your processor: " Indexer
((Indexer=Indexer-1))
Part_name_array[Category]=${CPU[Indexer]}
Part_cost_array[Category]=${CPU_cost[Indexer]}
done
fi
Indexer=9

if [[ $Category = 1 ]]
then
while [[ $Indexer != 0 && $Indexer != 1 && $Indexer != 2 && $Indexer != 3 ]]
do
./esportarsenal_Header.sh
Subheader
echo "1. ${Mobo[0]}, \$${Mobo_cost[0]}"
echo "2. ${Mobo[1]}, \$${Mobo_cost[1]}"
echo "3. ${Mobo[2]}, \$${Mobo_cost[2]}"
echo "4. ${Mobo[3]}, \$${Mobo_cost[3]}"
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
./esportarsenal_Header.sh
Subheader
echo "1. ${GPU[0]}, \$${GPU_cost[0]}"
echo "2. ${GPU[1]}, \$${GPU_cost[1]}"
echo "3. ${GPU[2]}, \$${GPU_cost[2]}"
echo "4. ${GPU[3]}, \$${GPU_cost[3]}"
read -p "Choose your graphics card: " Indexer
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
./esportarsenal_Header.sh
Subheader
echo "1. ${RAM[0]}, \$${RAM_cost[0]}"
echo "2. ${RAM[1]}, \$${RAM_cost[1]}"
echo "3. ${RAM[2]}, \$${RAM_cost[2]}"
echo "4. ${RAM[3]}, \$${RAM_cost[3]}"
read -p "Choose your RAM: " Indexer
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
./esportarsenal_Header.sh
Subheader
echo "1. ${PSU[0]}, \$${PSU_cost[0]}"
echo "2. ${PSU[1]}, \$${PSU_cost[1]}"
echo "3. ${PSU[2]}, \$${PSU_cost[2]}"
echo "4. ${PSU[3]}, \$${PSU_cost[3]}"
read -p "Choose your power supply: " Indexer
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
./esportarsenal_Header.sh
Subheader
echo "1. ${Case[0]}, \$${Case_cost[0]}"
echo "2. ${Case[1]}, \$${Case_cost[1]}"
echo "3. ${Case[2]}, \$${Case_cost[2]}"
echo "4. ${Case[3]}, \$${Case_cost[3]}"
read -p "Choose your case: " Indexer
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
./esportarsenal_Header.sh
Subheader
echo "1. ${SSD[0]}, \$${SSD_cost[0]}"
echo "2. ${SSD[1]}, \$${SSD_cost[1]}"
echo "3. ${SSD[2]}, \$${SSD_cost[2]}"
echo "4. ${SSD[3]}, \$${SSD_cost[3]}"
read -p "Choose your solid state drive: " Indexer
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
./esportarsenal_Header.sh
Subheader
echo "1. ${OS[0]}, \$${OS_cost[0]}"
echo "2. ${OS[1]}, \$${OS_cost[1]}"
echo "3. ${OS[2]}, \$${OS_cost[2]}"
echo "4. ${OS[3]}, \$${OS_cost[3]}"
read -p "Choose your operating system: " Indexer
((Indexer=Indexer-1))
Part_name_array[Category]=${OS[Indexer]}
Part_cost_array[Category]=${OS_cost[Indexer]}
done
fi
Indexer=9

./esportarsenal_Header.sh
Subheader
done
}
