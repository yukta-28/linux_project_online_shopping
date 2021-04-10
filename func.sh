#!/bin/bash

Assign_array(){

if [ $1 == 1 ]
then  cost=("${key_price[@]}")
      model_no=("${key_model[@]}")
elif [ $1 == 2 ]
then	
      cost=("${disk_price[@]}")
      model_no=("${disk_model[@]}")
fi
}

#*******************************************

Cal_Subtotal(){

Assign_array $1

price=${cost[$2-1]}
model_price=`echo $price*$3|bc`
total=`echo $4 + $price*$3|bc`

cart_item+=("${model_no[$2-1]}")
cart_quantity+=("$3")
cart_price+=("$model_price")


printf '%s\t\t\t%s\t%s\n' "${model_no[$2-1]}" "$3" "$model_price" >> cart.txt

}	  

#***************************************************

View_Cart(){

clear

figlet -c Your Cart

printf '%s\n' "--------------------------------------------------------"
printf '%s\t\t\t%s\t%s\n' "Item" "Quantity" "Price"
printf '%s\n' "--------------------------------------------------------"
i=0
for cart in "${cart_item[@]}"
do 
printf '%s\t\t%s\t\t%s\n' "${cart_item[i]}" "${cart_quantity[i]}" "${cart_price[i]}"
((i++))

done

printf '%s\n\n\n' "--------------------------------------------------------"

}

View_Models(){

Assign_array $1

i=0
count=1
for number in "${model_no[@]}"
     do
     echo $count.$number-------------\$${cost[i]}
     ((i++))
     ((count++))
     done
     echo "$count.Back to Product list"
     echo "$((count+1)).View Cart"
     echo -e "\n"
}
