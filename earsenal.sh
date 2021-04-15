clear
figlet -cf slant "E. Arsenal"
echo ""
echo ""
echo "Choose your store"
echo ""
echo "a. Ecomp Arsenal, computers & electornics online store"
echo "b. Esport Arsenal, Fast custom PC builder"
echo ""
read -p "Enter your choice: " choice

if [[ $choice == "a" ]]
then
  ./ecomp_arsenal.sh
else
  ./esportarsenal.sh
fi
