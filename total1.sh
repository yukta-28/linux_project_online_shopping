#!/bin/bash

read -p "Enter total price: " count

tax(){
subtotal=$1
tax=`echo "scale=2; $subtotal * 0.065" | bc` 
total=$(($subtotal + $tax))

if [ $subtotal -ge 400 ]
then 
echo "Congratulation You recived 10% discount on your purchase"
subtotal=`echo "scale=2; $1 * 0.90" | bc` 

echo $subtotal
else 
echo "$subtotal=$count"
fi 

echo "Your Total purchase cost is $total"
}

tax count
