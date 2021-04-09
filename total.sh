#!/bin/bash

read -p "Enter total price: " subtotal
total(){
echo "-----------------------------------"
echo "           Total                   "
echo "-----------------------------------"
if (( $(echo "$1 >= 400.00" |bc -l) ))
then
echo "Congratulation You Recived 10% discount on your total purchase"
discount=`echo "scale=2; $1 * 0.10" | bc`
final_price=`echo "scale=2; $1 - $discount" | bc`
tax=`echo "scale=2; $final_price * 6.5/100" | bc`
total=`echo "scale=2; $final_price + $tax" | bc`
echo "Subtotal is $1"
echo "Discount @10% is $discount"
echo "Tax @ 6.5% is $tax"
echo "Your Total price is $total"
else 
tax=`echo "scale=2; $1 * 6.5/100" | bc`
total=`echo "scale=2; $1 + $tax" | bc`
echo "subtotal is $1"
echo "Tax @ 6.5% is $tax"
echo "Your Total price is $total"
fi 

echo "Thank you for shopping with us online"
}
total $subtotal
