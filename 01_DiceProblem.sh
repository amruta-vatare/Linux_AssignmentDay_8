#!/bin/bash

declare -A diceDictionary

breakCondition=0
while(( $breakCondition == 0 ))
do	
	diceValue=$(( ( RANDOM % 6 )  + 1 ))
	echo $diceValue
	
	cnt=$(( ${diceDictionary[$diceValue]} ))
	if [ $cnt == 9 ]
	then		
		diceDictionary[$diceValue]=$(( cnt + 1 ))
		breakCondition=1
	else
		diceDictionary[$diceValue]=$(( cnt + 1 ))
	fi
done

minValue=0;
maxValue=0;
minValueDiceIndex=0;
maxValueDiceIndex=0;

for (( di=1; di<=6; di++ ))
do
	echo "No of occurences of dice index $di ==> ${diceDictionary[$di]}"	
	if [ $di -eq 1 ]
	then
		minValue=${diceDictionary[$di]}
		maxValue=${diceDictionary[$di]}		
	fi
	currentValue=${diceDictionary[$di]}

	if [ $currentValue -lt $minValue ]
	then
		minValueDiceIndex=$di
	fi
	
	if [ $currentValue -gt $maxValue ]
	then
		maxValueDiceIndex=$di
	fi
done

echo "Dice index which appeared max times ==> $maxValueDiceIndex"
echo "Dice index which appeared min times ==> $minValueDiceIndex"
	