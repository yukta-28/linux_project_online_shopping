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
echo "You trimmed 10% of the cost"
elif [[ $enter_code == $( cat discount2.txt ) ]]
echo "You trimmed 5% of the cost"
then
New_cart_total=$((Cart_total*95/100))
elif [[ $enter_code == "skip" ]]
then
New_cart_total=$Cart_total
fi

((Final_cart_total=New_cart_total*1065/1000))

echo "Previous cart total: \$$Cart_total"
echo "New cart total: \$$New_cart_total"
echo "Cart total with discount and 6.5% sales tax: \$$Final_cart_total"
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

touch "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"

echo "Delivery order" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"

echo "Custom PC info" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "CPU: ${Part_name_array[0]}, \$${Part_cost_array[0]}" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "Mobo: ${Part_name_array[1]}, \$${Part_cost_array[1]}" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "RAM: ${Part_name_array[2]}, \$${Part_cost_array[2]}" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "GPU: ${Part_name_array[3]}, \$${Part_cost_array[3]}" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "PSU: ${Part_name_array[4]}, \$${Part_cost_array[4]}" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "Case: ${Part_name_array[5]}, \$${Part_cost_array[5]}" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "SSD: ${Part_name_array[6]}, \$${Part_cost_array[6]}" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "OS: ${Part_name_array[7]}, \$${Part_cost_array[7]}" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"

echo "" >> "$(date +"%Y_%m_%d_%I_%M_%p")Home_delivery.txt"
echo "Previous cart total: $Cart_total" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "Discount code: $enter_code" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "New cart total: $New_cart_total" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "Cart total with discount and tax: $Final_cart_total" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "Total: \$$Cart_total" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"

echo "Shipping info" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "First name: $first_name" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "Last name: $last_name" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "Email: $email" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "Address line 1: $address_1" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "Address line 2: $address_2" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "City: $city" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "Country: $country" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "State: $state" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "Zip code: $zip" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "Phone: $phone" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
echo "" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Home_delivery.txt"
#echo "Address info added to order file"
fi

if [[ $send_or_keep == "b" ]]
then
echo "Store location: 420 Lane, Fairfax, VA, 12345"
echo "Custom PC creation takes up to 1 hour to complete. Please expect a minor delay when placing the order"
read -p "Hit enter to finalize your order: " send_product

touch "$(date +"%Y_%m_%d_%I_%M_%p")_Store_pickup.txt"

echo "Pick up order" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Store_pickup.txt"
echo "" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Store_pickup.txt"
echo "Custom PC info" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Store_pickup.txt"
echo "CPU: ${Part_name_array[0]}, \$${Part_cost_array[0]}" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Store_pickup.txt"
echo "Mobo: ${Part_name_array[1]}, \$${Part_cost_array[1]}" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Store_pickup.txt"
echo "RAM: ${Part_name_array[2]}, \$${Part_cost_array[2]}" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Store_pickup.txt"
echo "GPU: ${Part_name_array[3]}, \$${Part_cost_array[3]}" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Store_pickup.txt"
echo "PSU: ${Part_name_array[4]}, \$${Part_cost_array[4]}" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Store_pickup.txt"
echo "Case: ${Part_name_array[5]}, \$${Part_cost_array[5]}" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Store_pickup.txt"
echo "SSD: ${Part_name_array[6]}, \$${Part_cost_array[6]}" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Store_pickup.txt"
echo "OS: ${Part_name_array[7]}, \$${Part_cost_array[7]}" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Store_pickup.txt"
echo "" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Store_pickup.txt"
echo "Previous cart total: $Cart_total" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Store_pickup.txt"
echo "Discount code: $enter_code" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Store_pickup.txt"
echo "New cart total: $New_cart_total" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Store_pickup.txt"
echo "Cart total with discount and tax: $Final_cart_total" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Store_pickup.txt"
echo "Total: \$$Cart_total" >> "$(date +"%Y_%m_%d_%I_%M_%p")_Store_pickup.txt"
fi

figlet -f slant "Order sent"
figlet -f slant "Thank you"
