#!/bin/bash

function Assign_array(){	

#$1 -> Product no

case $1 in
      1)cost=("${key_price[@]}")
        model_no=("${key_model[@]}");;
      2)cost=("${disk_price[@]}")
        model_no=("${disk_model[@]}");;
      3)cost=("${monitor_price[@]}")
        model_no=("${monitor_model[@]}");;
      4)cost=("${video_price[@]}")
        model_no=("${video_model[@]}");;
      5)cost=("${processor_price[@]}")
        model_no=("${processor_model[@]}");;
      6)cost=("${printer_price[@]}")
        model_no=("${printer_model[@]}");;
      7)cost=("${mother_price[@]}")
        model_no=("${mother_model[@]}");;

esac

}

#*******************************************
# add product to cart array

Add_Product(){

#$1 -> Product no

Assign_array $1

echo -e "\n"
read -p "Please enter model you want to add in cart: " model
read -p "Please enter quantity of above model: " quantity


price=${cost[$model-1]}

cart_item+=("${model_no[$model-1]}")
cart_quantity+=("$quantity")
cart_price+=("$price")

echo "Product added"             
echo
echo "      Action list"
echo "------------------------"
echo "1) Continue shopping"
echo "2) View Cart"
echo "------------------------"
read -p "Select action >> " action
case $action in
        1)List_Products;;
	2)View_Cart;;
	  
esac

}	  

#***************************************************
# View Cart with subtotal 

View_Cart(){

clear

figlet -c Your Cart

printf '%s\n' "--------------------------------------------------------"
printf '%s\t\t\t%s\t%s\n' "Item" "Quantity" "Price"
printf '%s\n' "--------------------------------------------------------"

i=0
count=1
subtotal=0.00
qty=0


for item in "${cart_item[@]}"
     do
     printf '%s\t\t%s\t\t%s%s\n' "$count.$item" "${cart_quantity[i]}" "$" "${cart_price[i]}"
     
     qty=$(($qty + ${cart_quantity[i]}))

     subtotal=`echo $subtotal + ${cart_price[i]}*${cart_quantity[i]} | bc`
     ((i++))
     ((count++))
     done

printf '%s\n\n' "--------------------------------------------------------"
printf '\t\t\t\b\b\b%s%s\n' "Subtotal($qty items): $" $subtotal
printf '\t\t%s\n\n' "----------------------------------------"

echo "      Action list"
echo "------------------------"
echo "1)Continue shopping"
echo "2)Delete any item from cart"
echo "3)Check out"
echo "-----------------------------"
read -p "Select action >> " action
case $action in
        1)List_Products;;
        2)Delete_Item;;
        3)Check_Out;;
esac


}

#****************************************
#View models of a particular product

function View_Models(){

#$1 -> Product no , whose models needs to be viewed

Assign_array $1

i=0
count=1
echo -e "\n"
for number in "${model_no[@]}"
     do
     echo $count.$number-------------\$${cost[i]}
     ((i++))
     ((count++))
     done
echo -e "\n"
}

#*******************************************
#Delete items from cart

Delete_Item(){

# $1 --> product number from cart you want to remove
# $2 --> quantity of that product to remove


read -p "Enter cart item no you want to delete: " prod_id
read -p "Enter quantity of item to be deleted : " qty

if [ ${cart_quantity[$prod_id-1]} -eq $qty ]

then unset cart_item[$prod_id-1]
      cart_item=("${cart_item[@]}")
      unset cart_quantity[$prod_id-1]
     cart_quantity=(${cart_quantity[@]})
     unset cart_price[$prod_id-1]     
     cart_price=("${cart_price[@]}")

else
	cart_quantity[$prod_id-1]=$((${cart_quantity[$prod_id-1]} - $qty))

fi


echo 
echo -e "1) Delete an other item "
echo -e "2) View Cart"
echo -e "3) Continue shopping "
echo -e "4) Exit "
read -p "Select action >> " action

case $action in
        1) Delete_Item;;
        2) View_Cart;;
        3) List_product;;
        4) echo "Thank You for shopping with us"
	   exit;;

esac
}
#*********************************

Check_Out(){

clear

echo "*********************************"
echo "        Checkout Summary"
echo "*********************************"

echo "Subtotal($qty items) is $subtotal"
total $subtotal

echo "      Action list" 
echo "------------------------"
echo "1)Place Order"
echo "2)Continue shopping"
echo "3)Exit"

read -p "Select action >> " action
case $action in
	1)Place_order;;
	2)List_Products;;
        3)exit;;
esac
}
