#!/bin/bash

read -p "Enter total price: " subtotal
#subtotal=$subtotal
#tax=`echo "scale=2; $subtotal * 0.065" | bc`
if [[ $subtotal -lt 400 ]]
then
tax=`echo "scale=2; $subtotal * 0.065" | bc`
else
tax=`echo "scale 2; $final_price * 0.065" | bc`
fi

echo "Tax is $tax"
total=`echo "scale=2; $subtotal + $tax" | bc`
echo "Total is $total"

if [[ $subtotal -ge 400 ]]
then 
echo "Congratulation You recived 10% discount on your purchase"
discount=`echo "scale=2; $subtotal * 0.10" | bc` 
final_price=`echo "scale=2; $total - $discount" | bc`
echo "Subtotal is $subtotal"
echo "Discount @10% is $discount"
echo "Tax @ 6.5% is $tax"
echo "Final Price is $final_price"
else 
echo "Final Price is $total"
fi 

echo "Thank you for shopping with us online"
