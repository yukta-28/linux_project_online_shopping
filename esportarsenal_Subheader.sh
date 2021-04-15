function Subheader
{
echo "Your current tournament PC"
if [[ ${Part_name_array[0]} != "" ]]
then
echo "1. CPU: ${Part_name_array[0]}, \$${Part_cost_array[0]}"
fi
if [[ ${Part_name_array[1]} != "" ]]
then
echo "2. MOBO: ${Part_name_array[1]}, \$${Part_cost_array[1]}"
fi
if [[ ${Part_name_array[2]} != "" ]]
then
echo "3. GPU: ${Part_name_array[2]}, \$${Part_cost_array[2]}"
fi
if [[ ${Part_name_array[3]} != "" ]]
then
echo "4. RAM: ${Part_name_array[3]}, \$${Part_cost_array[3]}"
fi
if [[ ${Part_name_array[4]} != "" ]]
then
echo "5. PSU: ${Part_name_array[4]}, \$${Part_cost_array[4]}"
fi
if [[ ${Part_name_array[5]} != "" ]]
then
echo "6. Case: ${Part_name_array[5]}, \$${Part_cost_array[5]}"
fi
if [[ ${Part_name_array[6]} != "" ]]
then
echo "7. SSD: ${Part_name_array[6]}, \$${Part_cost_array[6]}"
fi
if [[ ${Part_name_array[7]} != "" ]]
then
echo "8. OS: ${Part_name_array[7]}, \$${Part_cost_array[7]}"
fi
#Cart_total=0
((Cart_total=${Part_cost_array[0]}+${Part_cost_array[1]}+${Part_cost_array[2]}+${Part_cost_array[3]}+${Part_cost_array[4]}+${Part_cost_array[5]}+${Part_cost_array[6]}+${Part_cost_array[7]}))
echo "Total price: \$$Cart_total"
echo ""
return $Cart_total
}
