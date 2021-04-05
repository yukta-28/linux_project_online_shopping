#!/bin/bash
clear

figlet -c Esport Arsenal 

echo "Computers & Electronics Online Store"
echo "************************************"

total=0

figlet -c Your Cart > cart.txt 

#Loading arrays with info about keyboard model and prices
while IFS=\= read -p "index, value: " model price
do
key_model+=(${model})
key_price+=(${price})

done<keyboards   

#Loading arrays with info about external hard disk model and prices

while IFS=\= read -p "index, value: " model price
do
disk_model+=(${model})
disk_price+=(${price})

done<external_hard_disk   

while true
do

# Printing Category Names 

cat products

read -p  "Which product you want to browse? " product 
i=0
count=1

#Displaying models of each product

case $product in 
   1)for number in "${key_model[@]}"
     do
     echo $count.$number-------------\$${key_price[i]}
     ((i++))
     ((count++))
     done;;
   2)for number in "${disk_model[@]}"
     do
     echo $count.$number-------------\$${disk_price[i]}
     ((i++))
     ((count++))
     done;;
esac
 
read -p "Do you want to add any model in cart? [y/n] " addp

if [[ $addp = "y" ]]
then 
     read -p "Please enter model you want to add in cart: " model 
     read -p "Please enter quantity of above model: " quantity

# Calculating total price based on products added to cart

     case $product in
        1) price=${key_price[model-1]}
           total=`echo $total + $price*$quantity|bc`
	   echo $total
	   echo "${key_model[model-1]}----- $quantity----$price" >> cart.txt;; 
        2) price=${disk_price[model-1]}
	   echo "Price is $price"
	   total=`echo $total + $price*$quantity|bc`
	   echo $total	
	   echo "${disk_model[model-1]}----- $quantity----$price" >> cart.txt;; 
     esac

elif [[ $addp = "n" ]]
then
  read -p "Do you want to browse another product? [y/n] >> " choice
  if [[ $choice = "y" ]]
  then continue
  else
  echo "************Reviewing your cart**********"
  clear
  cat cart.txt
  read -p "Do you want to checkout[y/n]: " check
   if [[ $check = "y" ]]
    then echo "Generating invoice"
    break   
   fi
 fi
fi


#echo "Thanks for visiting our store. Good bye"


#break

done
