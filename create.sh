#!/bin/bash

date=$(date '+%Y-%m-%d')
echo "********WELCOME TO AUTOMATIC USER CREATION ON AWS********"
echo "Enter the name of new employee"
read name
echo "Select Department\n"
echo "1. Cloud Architecture"
echo "2. Cloud Engineer"
echo "3. Cloud Operations"
read option
case "$option" in
 
"1")
	sed -i.bak -e "s/Shinzo/$name/g" -e "s/CustomBased/FullAccess/g"  main.tf > LOGS/$name-$date.txt
	terraform apply -auto-approve
	mv main.tf.bak main.tf	
	;;
"2")
	sed -i.bak -e "s/Shinzo/$name/g" -e "s/carch/cdev/g"  -e "s/CustomBased/WriteAccess/g" main.tf > LOGS/$name-$date.txt
        terraform apply -auto-approve
        mv main.tf.bak main.tf
	;;
"3")
	sed -i.bak -e "s/Shinzo/$name/g" -e "s/carch/cops/g"  -e "s/CustomBased/ReadOnlyAccess/g" main.tf > LOGS/$name-$date.txt
        terraform apply -auto-approve
        mv main.tf.bak main.tf
	;;

esac 

echo "********SCRIPT ENDED! USER WILL BE CREATED SHORTLY********"
