#!/bin/bash
./custompc1header.sh
Subheader
#total price reminder
#cart_total=1000
echo $Cart_total

while [[ $enter_code != $( cat discount1.txt ) && $enter_code != $( cat discount2.txt ) && $enter_code != "skip" ]]
do
./custompc1header.sh
#total price reminder
read -p "Enter discount code or enter \"skip\" for no code: " enter_code
done

if [[ $enter_code == $( cat discount1.txt ) && cart_total -ge 999 ]]
then
echo "Previous cart total: " $Cart_total
Cart_total=$((Cart_total*90/100))
echo "New cart total: " $Cart_total
fi

if [[ $enter_code == $( cat discount2.txt ) ]]
then
echo "Previous cart total: " $Cart_total
Cart_total=$((Cart_total*95/100))
echo "New cart total: " $Cart_total
fi

((Cart_total=Cart_total*1065/1000))

echo "Cart total with discount and tax: " $Cart_total
read -p "Press ENTER when you're ready to continue " Continue

#echo "whiles and ifs ended"
#read -p "wait" asdfasdf

while [[ $send_or_keep != "a" && $send_or_keep != "b" ]]
do
./custompc1header.sh
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
read -p "Is all of the delivery info correct? Hit enter to finalize your order" send_product

touch "$(date +"%Y_%m_%d_%I_%M_%p").txt"

echo "Delivery order" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
eco "" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"

echo "Custom PC info" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "CPU: ${Part_name_array[0]}, \$${Part_cost_array[0]}" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Mobo: ${Part_name_array[1]}, \$${Part_cost_array[1]}" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "RAM: ${Part_name_array[2]}, \$${Part_cost_array[2]}" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "GPU: ${Part_name_array[3]}, \$${Part_cost_array[3]}" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "PSU: ${Part_name_array[4]}, \$${Part_cost_array[4]}" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Case: ${Part_name_array[5]}, \$${Part_cost_array[5]}" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "SSD: ${Part_name_array[6]}, \$${Part_cost_array[6]}" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "OS: ${Part_name_array[7]}, \$${Part_cost_array[7]}" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Discount code: $enter_code" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Total: $Cart_total" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"

echo "Shipping info" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "First name: $first_name" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Last name: $last_name" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Email: $email" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Address line 1: $address_1" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Address line 2: $address_2" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "City: $city" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Country: $country" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "State: $state" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Zip code: $zip" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Phone: $phone" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Address info added to order file"
fi

if [[ $send_or_keep == "b" ]]
then
echo "Store location: 1337 elite street, Washington DC, 46290"
echo "Custom PC creation takes up to 1 hour to complete"
read -p "Hit enter to finalize your order: " send_product

touch "$(date +"%Y_%m_%d_%I_%M_%p").txt"

echo "Pick up order" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Custom PC info" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "CPU: ${Part_name_array[0]}, \$${Part_cost_array[0]}" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Mobo: ${Part_name_array[1]}, \$${Part_cost_array[1]}" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "RAM: ${Part_name_array[2]}, \$${Part_cost_array[2]}" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "GPU: ${Part_name_array[3]}, \$${Part_cost_array[3]}" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "PSU: ${Part_name_array[4]}, \$${Part_cost_array[4]}" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Case: ${Part_name_array[5]}, \$${Part_cost_array[5]}" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "SSD: ${Part_name_array[6]}, \$${Part_cost_array[6]}" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "OS: ${Part_name_array[7]}, \$${Part_cost_array[7]}" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Discount code: $enter_code" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
echo "Total: $Cart_total" >> "$(date +"%Y_%m_%d_%I_%M_%p").txt"
fi

figlet -f slant "Order sent"
figlet -f slant "Thank you"
