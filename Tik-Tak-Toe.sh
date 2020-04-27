
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
checkWin=0

#game is tie
function gameTie () {
	if [ $i -eq $TOTAL_CELLS ];
	then
			echo "Game is Tie"
	fi
}

#checking winner at Row
function checkingRow () {
	for ((count=1; count<$TOTAL_CELLS; count=count+3))
	do
			temp=$count
			if [[ ${playBoard[$temp]} == $letter ]]  &&  [[ ${playBoard[$temp]} == ${playBoard[$((temp+1))]} ]] && [[ ${playBoard[$((temp+1))]} ==  ${playBoard[$((temp+2))]} ]]
			then
					echo "$name Is Win"
					checkWin=1
					exit
			fi
	done
}


#checking winner at column
function checkingColumn () {
	for ((count=1; count<4; count++))
	do
			temp=$count
			if [[ ${playBoard[$temp]} == $letter ]] && [[ ${playBoard[$temp]} == ${playBoard[$((temp+3))]} ]]  && [[ ${playBoard[$((temp+3))]}  == ${playBoard[$((temp+6))]} ]]
			then
					echo "$name Is Win"
					checkWin=1
					exit
			fi
	done
}

#checking winner at diagonal
function checkingDiagonal () {
		if [[ ${playBoard[1]} == $letter ]] && [[ ${playBoard[5]} == $letter ]] && [[ ${playBoard[5]} == $letter ]] && [[ ${playBoard[9]} == $letter ]]
		then
				echo "$name IS Win"
				checkWin=1
		elif [[ ${playBoard[3]} == $letter ]] && [[ ${playBoard[5]} == $letter ]] && [[ ${playBoard[7]} == $letter ]]
		then
				echo "$name Is Win"
				checkWin=1
		fi
}


#check winner
function checkWinner () {
		letter=$1
		name=$2
		checkingRow
		checkingColumn
		checkingDiagonal
}

#check Position Available
function positionAvailable () {
	position=$1
	if [[ ${playBoard[$position]}  == " " ]];
	then
			playBoard[$position]=$2
	else
			echo "Please Enter valid position"
			changePlayer
	fi
}

#Player Turn
function playerTurn () {
		read -p "Enter Position:" position
		positionAvailable $position $player
		displayBoard
		checkWinner $player "Player"
		num=1
}

#computer turn
function computerTurn () {
		compuPosi=$((RANDOM%9 +1))
		echo "computer position" $compPosi
		positionAvailable  $compuPosi $computer
		displayBoard
		checkWinner $computer "Computer"
		num=0
}

#change player
function changePlayer () {
		if [ $num -eq 0 ];
		then
				echo "Player Turn"
				playerTurn
		else
				echo "Computer Turn"
				computerTurn
		fi
}

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

function main () {
	reset
	checkPlayFirst
	displayBoard
	for ((i=1; i<$TOTAL_CELLS; i++))
	do
			if [ $checkWin -eq 0 ];
			then
					changePlayer
					gameTie
			else
					break
			fi
	done
}


#calling main function
main
