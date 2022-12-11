#!/bin/bash

#Before starting
echo "Welcome please select your starting class:
1 - Samurai
2 - Prisoner
3 - Prophet"
read class
case $class in
	1)
		type="Samurai"
		hp=10
		atk=20
		;;
	2)
		type="Prisoner"
		hp=20
		atk=4
		;;
	3)
		type="Prophet"
		hp=10
		atk=7
		;;
esac
echo "You chose $type, your hp is $hp and your attack is $atk"
sleep 1

#First battle
beast=$(( $RANDOM % 2 ))

echo "First battle, pick between 0-1"


while $hp -gt 0 
do
	read player
	if [[ $player != $beast ]]; then
		echo "Try again"
		((hp--))
		if [[$hp == 0 ]]; then 
			echo "You died" 
			exit 1 
		fi 
	else
		echo "You win"
	fi	
done


#if [[ $beast == $player ]]; then
#	echo "Win"
#else
#	echo "You died"
#	exit 1
#fi
sleep 1

#Second battle
beast=$(( $RANDOM % 10 ))
echo "Boss battle, pick a number between 0-9"
read player

if [[ $beast == $player ]]; then
	echo "Win"
else
	echo "You died"
fi
echo "Boss picked : $beast"
