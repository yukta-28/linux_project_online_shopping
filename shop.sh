#!/bin/bash

array=(2 5 7 2 8 7)

toppings=(Pepperoni Ham Tomatoes Onions Jalapeno Cheese Res_Pepper Black_Olives)
prices=(0.50 0.35 0.40 0.35 0.55 0.60 0.75 0.80)

RED='\033[0;31m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

#To Add items to card function

function add_product_to_cart() {
	COUNT=`expr $1 - 1`
	echo $COUNT >> cart
}

# delete all products from the cart
function clean_cart() {
	rm -f cart
	touch cart
}

# this is for checking out all the products.
function check_out(){
	echo ""
	declare -A cart_map
	echo -e "${GREEN}Total price of your selected products is.${NC}"
	while read -r line;
	do	
		if [ ${cart_map[$line,0]+abc} ]
		then			
			cardItem=${cart_map[$line,1]}
			newCount=`expr $cardItem + 1`
			cart_map[$line,1]=$newCount;
		else	
			cart_map[$line,0]=$line;
			cart_map[$line,1]=1;
		fi	
	sequence=0
	productString=''
	done < cart

	total_price=0
	for i in "${!cart_map[@]}"
	do		
	  	if [[ $i == *,0 ]]
		  then
			productString="${toppings[${cart_map[$i]}]}"
			productPrice="${prices[${cart_map[$i]}]}"
		  else		
			
			productQuantity=${cart_map[$i]}					
		fi

		if [ $sequence -eq 0 ]
		then
			sequence=1
		else
			calcString="$productQuantity * $productPrice"
			price=$(bc <<< $calcString)
			productString="${productString}"" X${productQuantity} ""Price: $price"
			total_price=$(echo $total_price + $price | bc -l)
			echo -e "${CYAN}$productString${NC}"
			sequence=0
		fi
	done
	echo 
	echo -e "${GREEN}The total cost is $total_price${NC}"

	echo 
	echo -e "${GREEN}1: Continue shopping ${NC}"
	echo -e "${GREEN}2: Check out and Exit ${NC}"
	read -p "Select action >> " action

	case $action in 
	1) select_product;;
	2) exit;;
	esac

}

#To show cart function

function show_cart() {
	echo ""
	declare -A cart_map
	echo "Cart content:"
	while read -r line;
	do	
		if [ ${cart_map[$line,0]+abc} ]
		then			
			cardItem=${cart_map[$line,1]}
			newCount=`expr $cardItem + 1`
			cart_map[$line,1]=$newCount;
		else	
			cart_map[$line,0]=$line;
			cart_map[$line,1]=1;
		fi	
	sequence=0
	productString=''
	done < cart

	for i in "${!cart_map[@]}"
	do		
	  	if [[ $i == *,0 ]]
		  then
			productString="${toppings[${cart_map[$i]}]}"
			productPrice="${prices[${cart_map[$i]}]}"
		  else		
			
			productQuantity=${cart_map[$i]}					
		fi

		if [ $sequence -eq 0 ]
		then
			sequence=1
		else
			calcString="$productQuantity * $productPrice"
			price=$(bc <<< $calcString)
			productString="${productString}"" X${productQuantity} ""Price: $price"
			echo -e "${CYAN}$productString${NC}"
			sequence=0
		fi
	done
	
	echo ""
	echo "Actions list"
	echo "1 continue shopping "
	# echo "2 clean cart"
	echo "2 check out "
	echo "3 delete product from cart"
	# echo "5 see the cart"	
	echo "4 exit"
	read -p "Select action >> " action

	case $action in 
	1) select_product;;
	# 2) clean_cart;;
	2) check_out;;
	3) delete_product_from_cart;;
	# 5) show_cart;;
	4) exit;;
	esac

}

#Deleting items


function delete_product_from_cart() {
	echo "These are the toppings available: "
	echo "-------------------------"
	echo "ID Product Name"

	counter=1
	for topping in ${toppings[@]}
	do
	echo "$counter.$topping"
	((counter++))
	done
	echo "-------------------------"
	

	echo ""
	declare -A cart_map
	echo "Cart content:"
	while read -r line;
	do	
		if [ ${cart_map[$line,0]+abc} ]
		then			
			cardItem=${cart_map[$line,1]}
			newCount=`expr $cardItem + 1`
			cart_map[$line,1]=$newCount;
		else	
			cart_map[$line,0]=$line;
			cart_map[$line,1]=1;
		fi	
	sequence=0
	productString=''
	done < cart

	for i in "${!cart_map[@]}"
	do		
	  	if [[ $i == *,0 ]]
		  then
			productString="${toppings[${cart_map[$i]}]}"
			productPrice="${prices[${cart_map[$i]}]}"
		  else		
			
			productQuantity=${cart_map[$i]}					
		fi

		if [ $sequence -eq 0 ]
		then
			sequence=1
		else
			calcString="$productQuantity * $productPrice"
			price=$(bc <<< $calcString)
			productString="${productString}"" X${productQuantity} ""Price: $price"
			echo -e "${CYAN}$productString${NC}"
			sequence=0
		fi
	done



	read -p "Enter product id >> " input	
	echo $input
	product_id=`expr $input - 1`	

	while read -r line;	
	do
				
		if [ $line -eq $product_id ]
		then			
			product_id=-1
		else	
			echo $line >> tmp_cart
		fi
	done < cart

	rm -rf cart
	mv tmp_cart cart


	echo 
	echo -e "${GREEN}1: Delete an other item ${NC}"
	echo -e "${GREEN}2: Continue shopping ${NC}"
	echo -e "${GREEN}3: Exit ${NC}"
	read -p "Select action >> " action

	case $action in 
	1) delete_product_from_cart;;
	2) select_product;;
	2) exit;;
	esac

}


function select_product() {
	echo "These are the toppings available: "
	echo "-------------------------"
	counter=1
	for topping in ${toppings[@]}
	do
	echo "$counter.$topping"
	((counter++))
	done
	echo "-------------------------"
	read -p "Choose one toppings [1 - 8] >> " selection	
	add_product_to_cart $selection	
	echo "Product added"

	# read -p "Select action >> " action

	echo 
	echo -e "${GREEN}1: View Cart ${NC}"
	echo -e "${GREEN}2: Continue shopping ${NC}"
	echo -e "${GREEN}3: Exit ${NC}"
	read -p "Select action >> " action

	case $action in 
	1) show_cart;;
	2) select_product;;
	2) exit;;
	esac

}


while :
do
	select_product
	
done

