
#!/bin/bash -x

echo "Tik Tak Toe Problem"
declare -a playBoard

#CONSTANT
TOTAL_CELLS=10
NOUGHT="O"
CROSS="X"

#VARIABLES
player=""
computer=""

#Assigning nought or cross to player
function assignNoughtOrCross () {
	num=$((RANDOM%2))
	if [ $num -eq 0 ];
	then
			player=$CROSS
			computer=$NOUGHT
	else
			player=$NOUGHT
			computer=$CROSS
	fi
}

#checking who play first
function checkPlayFirst () {
	if [ $num -eq 0 ]
	then
			echo "Player play first"
			assignNoughtOrCross
	else
			echo "computer play first"
			assignNoughtOrCross
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

displayBoard
assignNoughtOrCross
checkPlayFirst
