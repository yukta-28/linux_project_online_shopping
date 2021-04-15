clear
figlet -f slant "E. Arsenal"
echo "* * * * * * * * * * Hyper Speed tournament PC Builder * * * * * * * * * *"
echo ""
echo ""

echo "Choose your store"
echo "a. Ecomp Arsenal, computers & electornics online store"
echo "b. Esport Arsenal, Fast custome PC builder"
read -p "" choice

if [[ choice == "b" ]]
then
./custompc1.sh
fi
