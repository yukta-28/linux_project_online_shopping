#!/bin/bash
source esportarsenal_Initialize.sh
source esportarsenal_Subheader.sh
source esportarsenal_Choose.sh

./esportarsenal_Header.sh
Subheader
Choose

./esportarsenal_Header.sh
Subheader

#Category=0
while [[ $Category != 999 ]]
do
read -p "Want to change any parts? Enter the part category number or enter 999 to continue to discount code entry: " Category
if [[ $Category == 1 || $Category == 2 || $Category == 3 || $Category == 4 || $Category == 5 || $Category == 6 || $Category == 7 || $Category == 8 ]]
then
Part_name_array[Category-1]=""
Part_cost_array[Category-1]=0
fi
./esportarsenal_Header.sh
Subheader
Choose
done


#while [[ $Category != 999 ]]
#do
#./esportarsenal_Header.sh
#Subheader
#while [[ $Category == 1 || $Category == 2 || $Category == 3 || $Category == 4 || $Category == 5 || $Category == 6 || #$Category == 7 || $Category == 8 ]]
#do
#read -p "Want to remove any parts to make any new choices? Enter the part category number or enter 999 to continue: " #Category
#Part_name_array[Category-1]=""
#Part_cost_array[Category-1]=0
#./esportarsenal_Header.sh
#Subheader
#Choose
#done
#./esportarsenal_Header.sh
#Subheader
#read -p "Want to remove any parts to make any new choices? Enter the part category number or enter 999 to continue: #" Category
#Part_name_array[Category-1]=""
#Part_cost_array[Category-1]=0
#Choose
#done

./esportarsenal_Header.sh
Subheader
source ./esportarsenal_Ship.sh
