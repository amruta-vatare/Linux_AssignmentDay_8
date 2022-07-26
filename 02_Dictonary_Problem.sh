#!/bin/bash

declare -A birthDates
declare -A monthWiseBirthDates

function getDaysInMonth()
{
	paramYear=$1
	paramMonth=$2
	
	if [ $paramMonth == 2 ]
	then
			a=`expr $paramYear % 4`
			b=`expr $paramYear % 100`
			c=`expr $paramYear % 400`
		 if [ $c -eq 0 -o $a -eq 0 -a $b -ne 0 ]
		 then
			day=$(( ( RANDOM % 29 )  + 1 ))
		 else
			day=$(( ( RANDOM % 28 )  + 1 ))
		 fi
	elif [ $paramMonth -le 7 ]
	then	
		if [ $(( (paramMonth%2) )) == 0 ]
		then
			day=$(( ( RANDOM % 30 )  + 1 ))
		else
			day=$(( ( RANDOM % 31 )  + 1 ))
		fi
	else
		if [ $(( (paramMonth%2) )) == 0 ]
		then
			day=$(( ( RANDOM % 31 )  + 1 ))
		else
			day=$(( ( RANDOM % 30 )  + 1 ))
		fi
	fi
}

for (( i=1; i<=50; i++ ))
do
	
	y=$((RANDOM%2))
	if [ $y == 0 ]
	then
		year=1992
	else
		year=1993
	fi
	
	month=$(( ( RANDOM % 12 )  + 1 ))
	#echo $month
	getDaysInMonth $year $month
	#echo "day: $day"

	if [ $month -lt 10 ]
	then 
		fMonth="0$month"
	else
		fMonth="$month"
	fi

	if [ $day -lt 10 ]
	then 
		fday="0$day"
	else
		fday="$day"
	fi
	
	echo "Person $i bdate is ==> $fday - $fMonth - $year"
	bdate=$(date --date "$year-$fMonth-$fday")
	
	birthDates["$i"]=$bdate
	
	monthWiseBirthDates[$month]="${monthWiseBirthDates[$month]} $i"
done

for (( mi=1; mi<=12; mi++ ))
do
	echo "People born in month $mi ==> ${monthWiseBirthDates[$mi]}"
done
