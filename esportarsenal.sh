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
if [[ $Category == 0 || $Category == 1 || $Category == 2 || $Category == 3 || $Category == 4 || $Category == 5 || $Category == 6 || $Category == 7 ]]
then
Part_name_array[Category]=""
Part_cost_array[Category]=0
fi
./esportarsenal_Header.sh
Subheader
Choose
done

./esportarsenal_Header.sh
Subheader
source ./esportarsenal_Ship.sh
