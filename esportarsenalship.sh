#!/bin/bash
#echo $Cart_total

while [[ $enter_code != $( cat discount1.txt ) && $enter_code != $( cat discount2.txt ) && $enter_code != "skip" ]]
do
./esportarsenalheader.sh
read -p "Enter discount code or enter \"skip\" for no code: " enter_code
done

if [[ $enter_code == $( cat discount1.txt ) ]]
then
New_cart_total=$((Cart_total*90/100))
((Final_cart_total=New_cart_total*1065/1000))
echo "You trimmed 10% of the cost"
echo "Previous cart total: \$$Cart_total"
echo "New cart total: \$$New_cart_total"
echo "Cart total with discount and 6.5% sales tax: \$$Final_cart_total"
elif [[ $enter_code == $( cat discount2.txt ) ]]
then
New_cart_total=$((Cart_total*95/100))
echo "You trimmed 5% of the cost"
echo "Previous cart total: \$$Cart_total"
echo "New cart total: \$$New_cart_total"
echo "Cart total with discount and 6.5% sales tax: \$$Final_cart_total"
elif [[ $enter_code == "skip" ]]
then
New_cart_total=$Cart_total
((Final_cart_total=New_cart_total*1065/1000))
echo "Cart total: \$$Cart_total"
echo "Cart total with 6.5% sales tax: \$$Final_cart_total"
fi


read -p "Press ENTER when you're ready to continue " Continue

while [[ $send_or_keep != "a" && $send_or_keep != "b" ]]
do
./esportarsenalheader.sh
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
echo "Enter your shipping info"
read -p "First name: " first_name
read -p "Last name: " last_name
read -p "Email: " email
read -p "Address line 1: " address_1
read -p "Address line 2: " address_2
read -p "City: " city
read -p "Country: " country
read -p "State: " state
read -p "Zip code: " zip
read -p "Phone number: " phone

echo "Custom PCs need up to 1 hour to fully assemble. Please expect a minor delay before delivery"
read -p "Is all of the delivery info correct? Hit enter to finalize your order: " send_product

touch "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"

echo "Delivery order" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"

echo "" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Custom PC info" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "CPU: ${Part_name_array[0]}, \$${Part_cost_array[0]}" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Mobo: ${Part_name_array[1]}, \$${Part_cost_array[1]}" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "RAM: ${Part_name_array[2]}, \$${Part_cost_array[2]}" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "GPU: ${Part_name_array[3]}, \$${Part_cost_array[3]}" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "PSU: ${Part_name_array[4]}, \$${Part_cost_array[4]}" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Case: ${Part_name_array[5]}, \$${Part_cost_array[5]}" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "SSD: ${Part_name_array[6]}, \$${Part_cost_array[6]}" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "OS: ${Part_name_array[7]}, \$${Part_cost_array[7]}" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"

echo "" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Previous cart total: \$$Cart_total" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Discount code: $enter_code" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "New cart total: \$$New_cart_total" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Cart total with discount and tax: \$$Final_cart_total" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"

echo "" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Shipping info" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "First name: $first_name" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Last name: $last_name" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Email: $email" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "Address line 1: $address_1" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Address line 2: $address_2" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "City: $city" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Country: $country" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "State: $state" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Zip code: $zip" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Phone: $phone" >> "Home_delivery__$(date +"%Y_%m_%d_%I_%M_%p").txt"
#echo "Address info added to order file"
fi

if [[ $send_or_keep == "b" ]]
then
echo "Store location: 420 Lane, Fairfax, VA, 12345"
echo "Custom PC creation takes up to 1 hour to complete. Please expect a minor delay when placing the order"
read -p "Hit enter to finalize your order: " send_product

touch "Store_pickup__$(date +"%Y_%m_%d_%I_%M_%p").txt"

echo "Pick up order" >> "Store_pickup__$(date +"%Y_%m_%d_%I_%M_%p").txt"

echo "" >> "Store_pickup__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Custom PC info" >> "Store_pickup__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "CPU: ${Part_name_array[0]}, \$${Part_cost_array[0]}" >> "Store_pickup__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Mobo: ${Part_name_array[1]}, \$${Part_cost_array[1]}" >> "Store_pickup__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "RAM: ${Part_name_array[2]}, \$${Part_cost_array[2]}" >> "Store_pickup__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "GPU: ${Part_name_array[3]}, \$${Part_cost_array[3]}" >> "Store_pickup__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "PSU: ${Part_name_array[4]}, \$${Part_cost_array[4]}" >> "Store_pickup__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Case: ${Part_name_array[5]}, \$${Part_cost_array[5]}" >> "Store_pickup__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "SSD: ${Part_name_array[6]}, \$${Part_cost_array[6]}" >> "Store_pickup__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "OS: ${Part_name_array[7]}, \$${Part_cost_array[7]}" >> "Store_pickup__$(date +"%Y_%m_%d_%I_%M_%p").txt"

echo "" >> "Store_pickup__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Previous cart total: \$$Cart_total" >> "Store_pickup__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Discount code: $enter_code" >> "Store_pickup__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "New cart total: \$$New_cart_total" >> "Store_pickup__$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Cart total with discount and tax: \$$Final_cart_total" >> "Store_pickup__$(date +"%Y_%m_%d_%I_%M_%p").txt"
fi

figlet -f slant "Order sent"
figlet -f slant "Thank you"
