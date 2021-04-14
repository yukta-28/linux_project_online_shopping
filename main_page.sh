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
done<keyboard.txt  

#Loading arrays with info about external hard disk model and prices

while IFS=\= read -p "model no,price: " model price
do
  disk_model+=(${model})
  disk_price+=(${price})
done<external_hard_disk.txt   


#Loading arrays with info about monitors model and prices

while IFS=\= read -p "model no,price: " model price
do
  monitor_model+=(${model})
  monitor_price+=(${price})
done<monitor.txt   


#Loading arrays with info about video card model and prices

while IFS=\= read -p "model no,price: " model price
do
  video_model+=(${model})
  video_price+=(${price})
done<video_card.txt


#Loading arrays with info about processor model and prices

while IFS=\= read -p "model no,price: " model price
do
  processor_model+=(${model})
  processor_price+=(${price})
done<processor.txt


#Loading arrays with info about printer model and prices

while IFS=\= read -p "model no,price: " model price
do
  printer_model+=(${model})
  printer_price+=(${price})
done<printer.txt

#Loading arrays with info about motherboard model and prices

while IFS=\= read -p "model no,price: " model price
do
  mother_model+=(${model})
  mother_price+=(${price})
done<motherboard.txt


# Starting main while loop

List_Products(){
cat products

   read -p "Choose Product no. to browse: " product
    
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
