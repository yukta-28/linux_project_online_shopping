#!/bin/bash

source ./func.sh
source ./total.sh

clear

figlet -c Ecomp Arsenal 

echo "                  Computers & Electronics Online Store"
echo "               *******************************************"
echo                                     


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

List_Products(){
cat products

   read -p "Choose Product no to browse: " product
    
   View_Models $product 
   echo "      Action list" 
   echo "------------------------"
   echo "1)Add product"
   echo "2)View Cart "
   echo "3)Continue shopping "
   echo "4)Exit "
   read -p "Select action >> " action	
   case $action in
	   1)Add_Product $product;;
           2)View_Cart;;
	   3)List_Products;;
	   4)echo "Thank You for shopping with us !!"
             exit;;
   esac

}



while :
do
   	List_Products	
   
done
