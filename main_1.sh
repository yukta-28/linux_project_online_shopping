#!/bin/bash
clear

figlet -c Esport Arsenal 

echo "Computers & Electronics Online Store"
echo "************************************"

echo "CATEGORIES"
while true
do
echo "1 CPU"
#echo "    1. AMD CPU------\$300.00"
#echo "    2. Intel CPU----\$250.00"
echo "2 GPU"
#echo "    1. AMD GPU------\$100.00"
#echo "    2. NVidia GPU---\$200.00"  

read -p  "Which category you want to browse? " category
case $category in
	1) echo "    1. AMD CPU------\$300.00"
           echo "    2. Intel CPU----\$250.00";;	
	2) echo "    1. AMD GPU------\$100.00"
           echo "    2. NVidia GPU---\$200.00";;
	*) echo "    Invalid Category ";;
esac
read -p "Please enter product you want to add in cart: " product
if [ $category -eq 1 ] && [ $product -eq 1 ] 
then echo "good"

#	total = total + 250 * 2
#
	total = total + 200 * 3
fi

read -p "Do you want to review your cart[y/n]: " cart
read -p "Do you want to browse another category? [1 for Yes or 2 for No] >> " choice
if [[ $choice -eq 2 ]]; then
#echo "Thanks for visiting our store. Good bye"


break
fi
done
