#!/bin/bash
#echo $Cart_total

while [[ $enter_code != $( cat discount1.txt ) && $enter_code != $( cat discount2.txt ) && $enter_code != "skip" ]]
do
./esportarsenal_Header.sh
read -p "Enter discount code or enter \"skip\" for no code: " enter_code
done

if [[ $enter_code == $( cat discount1.txt ) ]]
then
New_cart_total=$((Cart_total*90/100))
Final_cart_total=$((New_cart_total*1065/1000))
echo "You trimmed 10% of the cost"
echo "Previous cart total: \$$Cart_total"
echo "New cart total: \$$New_cart_total"
echo "Cart total with discount and 6.5% sales tax: \$$Final_cart_total"
elif [[ $enter_code == $( cat discount2.txt ) ]]
then
New_cart_total=$((Cart_total*95/100))
Final_cart_total=$((New_cart_total*1065/1000))
echo "You trimmed 5% of the cost"
echo "Previous cart total: \$$Cart_total"
echo "New cart total: \$$New_cart_total"
echo "Cart total with discount and 6.5% sales tax: \$$Final_cart_total"
elif [[ $enter_code == "skip" ]]
then
New_cart_total=$Cart_total
Final_cart_total=$((New_cart_total*1065/1000))
echo "Cart total: \$$Cart_total"
echo "Cart total with 6.5% sales tax: \$$Final_cart_total"
fi


read -p "Press ENTER when you're ready to continue " Continue

while [[ $send_or_keep != "a" && $send_or_keep != "b" ]]
do
./esportarsenal_Header.sh
echo "Previous cart total: $Cart_total"
echo "New cart total: $New_cart_total"
echo "Cart total with discount and 6.5% sales tax: $Final_cart_total"
echo ""
echo "Home delivery or store pickup: "
echo "a. Home delivery"
echo "b. Store pickup"
read -p "Decision: " send_or_keep
done

if [[ $send_or_keep == "a" ]]
then
while [[ $correct_ship_info != "yes" ]]
do
./esportarsenal_Header.sh
echo "Previous cart total: $Cart_total"
echo "New cart total: $New_cart_total"
echo "Cart total with discount and 6.5% sales tax: $Final_cart_total"
echo ""
echo "Enter your shipping info"
read -p "First name: " first_name
read -p "Last name: " last_name
read -p "Email: " email
read -p "Address line 1: " address_1
read -p "Address line 2: " address_2
read -p "City: " city
read -p "State: " state
read -p "Country: " country
read -p "Zip code: " zip
read -p "Phone number: " phone
read -p "Is your shipping info correct? Enter yes to continue or no to redo: " correct_ship_info
done

echo ""
echo "Custom PCs need up to 1 hour to fully assemble. Please expect a minor delay before delivery"
echo ""

while [[ $send_product != "send" && $send_product != "exit" ]]
do
read -p "Ready to finalize the order? Enter send to place order or exit to cancel: " send_product
done

if [[ $send_product == "send" ]]
then
Order_file="Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
touch $Order_file

echo "Delivery order" >> $Order_file

echo "" >> $Order_file
echo "Custom PC info" >> $Order_file
echo "CPU: ${Part_name_array[0]}, \$${Part_cost_array[0]}" >> $Order_file
echo "Mobo: ${Part_name_array[1]}, \$${Part_cost_array[1]}" >> $Order_file
echo "RAM: ${Part_name_array[2]}, \$${Part_cost_array[2]}" >> $Order_file
echo "GPU: ${Part_name_array[3]}, \$${Part_cost_array[3]}" >> $Order_file
echo "PSU: ${Part_name_array[4]}, \$${Part_cost_array[4]}" >> $Order_file
echo "Case: ${Part_name_array[5]}, \$${Part_cost_array[5]}" >> $Order_file
echo "SSD: ${Part_name_array[6]}, \$${Part_cost_array[6]}" >> $Order_file
echo "OS: ${Part_name_array[7]}, \$${Part_cost_array[7]}" >> $Order_file

echo "" >> $Order_file
echo "Previous cart total: \$$Cart_total" >> $Order_file
echo "Discount code: $enter_code" >> $Order_file
echo "New cart total: \$$New_cart_total" >> $Order_file
echo "Cart total with discount and tax: \$$Final_cart_total" >> $Order_file

echo "" >> $Order_file
echo "Shipping info" >> $Order_file
echo "First name: $first_name" >> $Order_file
echo "Last name: $last_name" >> $Order_file
echo "Email: $email" >> $Order_file
echo "Address line 1: $address_1" >> $Order_file
echo "Address line 2: $address_2" >> $Order_file
echo "City: $city" >> $Order_file
echo "Country: $country" >> $Order_file
echo "State: $state" >> $Order_file
echo "Zip code: $zip" >> $Order_file
echo "Phone: $phone" >> $Order_file

figlet -f slant "Order sent"
figlet -f slant "Thank you"
fi
fi

if [[ $send_or_keep == "b" ]]
then
echo "Store location: 420 Elite Lane, Fairfax, VA, 12345"
echo "Custom PC creation takes up to 1 hour to complete. Please expect a minor delay when placing the order"
echo ""
while [[ $send_product != "send" && $send_product != "exit" ]]
do
read -p "Are you ready for us to start building? Enter send to place order or exit to cancel: " send_product
done

if [[ $send_product == "send" ]]
then
Order_file="Store_pickup__$(date +"%Y_%m_%d_%I_%M_%p").txt"
touch $Order_file

echo "Pick up order" >> $Order_file

echo "" >> $Order_file
echo "Custom PC info" >> $Order_file
echo "CPU: ${Part_name_array[0]}, \$${Part_cost_array[0]}" >> $Order_file
echo "Mobo: ${Part_name_array[1]}, \$${Part_cost_array[1]}" >> $Order_file
echo "RAM: ${Part_name_array[2]}, \$${Part_cost_array[2]}" >> $Order_file
echo "GPU: ${Part_name_array[3]}, \$${Part_cost_array[3]}" >> $Order_file
echo "PSU: ${Part_name_array[4]}, \$${Part_cost_array[4]}" >> $Order_file
echo "Case: ${Part_name_array[5]}, \$${Part_cost_array[5]}" >> $Order_file
echo "SSD: ${Part_name_array[6]}, \$${Part_cost_array[6]}" >> $Order_file
echo "OS: ${Part_name_array[7]}, \$${Part_cost_array[7]}" >> $Order_file

echo "" >> $Order_file
echo "Previous cart total: \$$Cart_total" >> $Order_file
echo "Discount code: $enter_code" >> $Order_file
echo "New cart total: \$$New_cart_total" >> $Order_file
echo "Cart total with discount and tax: \$$Final_cart_total" >> $Order_file

figlet -f slant "Order sent"
figlet -f slant "Thank you"
fi
fi

if [[ $send_product == "exit" ]]
then
echo "The order was canceled. Thank you for checking out the store"
fi
