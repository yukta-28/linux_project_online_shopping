#!/bin/bash

source ./ecomp_functions.sh
clear

echo -e "\n"
figlet -c -f slant Ecomp Arsenal
echo "                     Computers & Electronics Online Store"
echo "                **********************************************"
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


while :
do
   	List_Products	
   
done
