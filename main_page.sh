#!/bin/bash

source ./func.sh 

clear

figlet -c Ecomp Arsenal 

echo "                  Computers & Electronics Online Store"
echo "               *******************************************"
echo "                                    "

total=0

#Loading arrays with info about keyboard model and prices

while IFS=\= read -p "model no, price: " model price
do
  key_model+=(${model})
  key_price+=(${price})
done<keyboards   

#Loading arrays with info about external hard disk model and prices

while IFS=\= read -p "model no,price: " model price
do
  disk_model+=(${model})
  disk_price+=(${price})
done<external_hard_disk   

# Starting main while loop

while true
do

# Printing Product Names 
cat products

read -p  "Which product you want to browse? " product
echo -e "\n"

#Displaying models of each product

View_Models $product


read -p "Please choose model no to add in cart or other options : " model 
#read -p "Do you want to add any model in cart? [y/n] " addp
echo -e "\n"

if [[ $model -lt $count ]]
then 
  #  read -p "Please enter model you want to add in cart: " model 
    read -p "Please enter quantity of above model: " quantity

  # Calculating total price based on products added to cart
    
    Cal_Subtotal $product $model $quantity $total

    echo "Total is $total"

    read -p "Do you want to browse another product? [y/n]: " choice
    if [[ $choice = "y" ]]
       then continue
    else
       echo "Show cart"
       View_Cart 
     fi	     
elif [[ $model -eq $((count)) ]]
then 
	echo 
	continue
else
 #  echo  "View cart"
   View_Cart  
fi    


#elif [[ $addp = "n" ]]
#then
#  read -p "Do you want to browse another product? [y/n]: " choice
#  if [[ $choice = "y" ]]
#  then continue
#  else
#	  ./cart.sh
#	  break
#   echo "************Reviewing your cart**********"
#   clear
#   cat cart.txt
#   read -p "Do you want to checkout[y/n]: " check
#    if [[ $check = "y" ]]
#     then echo "Generating invoice"
#     break   
#    fi
# fi
#fi

done
