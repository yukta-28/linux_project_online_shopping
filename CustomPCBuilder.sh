#!/bin/bash
clear
echo ""
echo ""
echo "WARNING: THIS IS A PROTOTYPE SCRIPT. DON'T ENTER REAL ADDRESS/PAYMENT INFO"
figlet -f slant "Esport Arsenal"
echo "* * * * * * * * * * * Hyper speed tournament PC shop * * * * * * * * * * *"
echo ""
echo ""



AMDCPU=""
AMDMOBO=""
GPU=""
RAM=""
PSU=""
CASE=""
MONITOR=""
MOUSE=""
KEYBOARD=""
SSD=""
OS=""

AMDCPUCOST=0
AMDMOBOCOST=0
GPUCOST=0
RAMCOST=0
PSUCOST=0
CASECOST=0
MONITORCOST=0
MOUSECOST=0
KEYBOARDCOST=0
SSDCOST=0
OSCOST=0

CARTTOTAL=0



echo "* * * * * * * * * * * CHOOSE YOUR AMD CPU * * * * * * * * * * *"
# echo "Type either a, b, c, d, e, or f then hit enter" # Commented because it looks like clutter
echo ""

while [[ $AMDCPU != "a" && $AMDCPU != "b" && $AMDCPU != "c" && $AMDCPU != "d" && $AMDCPU != "e" && $AMDCPU != "f" ]]
do
echo "a. AMD R3, \$100.00"
echo "b. AMD R5, \$200.00"
echo "c. AMD R7, \$300.00"
echo "d. AMD R9, \$400.00"
# echo "" # Commented because too much spacing
echo "e. Leave blank"
echo "f. Cancel custom computer creation"
echo ""
read -p "Which do you choose? " AMDCPU
echo ""
done

if [[ $AMDCPU == "a" ]]
then
echo "You have chosen AMD R3"
AMDCPUCOST=100.00
AMDCPU="AMD R3"
fi

if [[ $AMDCPU == "b" ]]
then
echo "You have chosen AMD R5"
AMDCPUCOST=200.00
AMDCPU="AMD R3"
fi

if [[ $AMDCPU == "c" ]]
then
echo "You have chosen AMD R7"
AMDCPUCOST=300.00
AMDCPU="AMD R3"
fi

if [[ $AMDCPU == "d" ]]
then
echo "You have chosen AMD R9"
AMDCPUCOST=400.00
AMDCPU="AMD R3"
fi

if [[ $AMDCPU == "e" ]]
then
echo "You have chosen no CPU"
AMDCPUCOST=0.00
AMDCPU="AMD R3"
fi

if [[ $AMDCPU == "f" ]]
then
echo "CREATE LOOP BREAK FOR CHOICE F"
fi



# echo ""
# echo ""
clear



echo "* * * * * * * * * * * CHOOSE YOUR AMD MOBO * * * * * * * * * * *"
# echo "Type either a, b, c, d, e, or f then hit enter" # Commented because it looks like clutter
echo ""

while [[ $AMDMOBO != "a" && $AMDMOBO != "b" && $AMDMOBO != "c" && $AMDMOBO != "d" && $AMDMOBO != "e" && $AMDMOBO != "f" ]]
do
echo "a. ASrock, \$150.00"
echo "b. Asus, \$250.00"
echo "c. Gigabyte, \$350.00"
echo "d. MSI, \$450.00"
# echo "" # Commented because too much spacing
echo "e. Leave blank"
echo "f. Cancel custom computer creation"
echo ""
read -p "Which do you choose? " AMDMOBO
echo ""
done

if [[ $AMDMOBO == "a" ]]
then
echo "You have chosen ASRock"
AMDMOBOCOST=150.00
AMDMOBO="AMD R3"
fi

if [[ $AMDMOBO == "b" ]]
then
echo "You have chosen Asus"
AMDMOBOCOST=250.00
AMDMOBO="AMD R3"
fi

if [[ $AMDMOBO == "c" ]]
then
echo "You have chosen Gigabyte"
AMDMOBOCOST=350.00
AMDMOBO="AMD R3"
fi

if [[ $AMDMOBO == "d" ]]
then
echo "You have chosen MSI"
AMDMOBOCOST=450.00
AMDMOBO="AMD R3"
fi

if [[ $AMDMOBO == "e" ]]
then
echo "You have chosen no MOBO"
AMDMOBOCOST=0.00
AMDMOBO="AMD R3"
fi

if [[ $AMDMOBO == "f" ]]
then
echo "CREATE LOOP BREAK FOR CHOICE F"
fi

# echo ""
# echo ""
clear




echo "* * * * * * * * * * * Your custom tournament PC contains * * * * * * * * * * *"
echo ""
echo "CPU: $AMDCPU"
echo "MOBO: $AMDMOBO"
echo "GPU: $GPU"
echo "RAM: $RAM"
echo "PSU: $PSU"
echo "Case: $CASE"
echo "Monitor: $MONITOR"
echo "Mouse: $MOUSE"
echo "Keyboard: $KEYBOARD"
echo "SSD: $SSD"
echo "OS: $OS"
echo ""

CARTTOTAL=$(( $AMDCPUCOST+ $AMDMOBOCOST + $GPUCOST + $RAMCOST + $PSUCOST + $CASECOST + $MONITORCOST + $MOUSECOST + $KEYBOARDCOST + $SSDCOST + $OSCOST))
echo "Your custom tournament PC costs: \$$CARTTOTAL"
echo ""

echo "Are you ready for your new tournament PC?"
PERFANSWER=""

while [[ $PERFANSWER != "a" && $PERFANSWER != "b"  ]]
do
echo "a. yes"
echo "b. no"
read -p "" PERFANSWER
echo ""
# Break needed for no. We need to let users loop back to where they want to started
done

echo ""

echo "Got a discount code? "
DISCOUNT=""
# The codes for this test are mlg2021 and evo2021

while [[ $DISCOUNT != "evo2021" && $DISCOUNT != "mlg2021" && $DISCOUNT != "no" ]]
do
read -p "Enter the discount. Type no if you don't know any: " DISCOUNT
done

if [[ $DISCOUNT == "evo2021" ]]
then
echo "5% of the total cost trimmed"
echo "Old cart total: $CARTTOTAL"
CARTTOTAL=$(($CARTTOTAL*95/100))
echo "New cart total: $CARTTOTAL"
fi

if [[ $DISCOUNT == "mlg2021" ]]
then
echo "5% of the total cost trimmed"
echo "Old cart total: $CARTTOTAL"
CARTTOTAL=$CARTTOTAL*95/100
echo "New cart total: $CARTTOTAL"
fi

echo ""






exit N
