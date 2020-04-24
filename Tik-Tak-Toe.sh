#!/bin/bash -x

declare -a playBoard

#CONSTANT
TOTAL_CELLS=10

#Assigning nought or cross to player
function assignNoughtOrCross () {
	number=$((RANDOM%2))
	if [ $number -eq 0 ];
	then
			player=$CROSS
			computer=$NOUGHT
	else
			player=$NOUGHT
			computer=$CROSS
	fi
}

#display play Board
function displayBoard () {
	echo "Play Board"
	echo "----------"
	for((count=1; count<$TOTAL_CELLS; count++))
	do
			echo "${playBoard[$count]} | ${playBoard[$((++count))]} | ${playBoard[$((++count))]}"
			echo "---------"
	done
}

#resetting board
function resetBoard () {
	for ((count=1; count<$TOTAL_CELLS; count++))
	do
			playBoard[$count]=" "
	done
}
