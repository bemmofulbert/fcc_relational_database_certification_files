#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

echo Enter your username:
read USERNAME_READ

if [[ $USERNAME_READ ]]
  then
    USERNAME=$($PSQL "SELECT username FROM users WHERE username='$USERNAME_READ'")
  else exit
fi

if [[ $USERNAME ]]
  then 
    BEST_SCORE=$($PSQL "SELECT CAST(score AS text) FROM users WHERE username='$USERNAME_READ'")
    GAME_COUNT=$($PSQL "SELECT CAST(game_count AS text) FROM users WHERE username='$USERNAME_READ'")
    
    echo Welcome back, $USERNAME_READ! You have played $GAME_COUNT games, and your best game took $BEST_SCORE guesses.
  else
    USERNAME=$USERNAME_READ
    NEW=1
    echo Welcome, $USERNAME! It looks like this is your first time here.
fi

SECRET_NUMBER=$((RANDOM%1000 + 1))
NUMBER_GUESSES=0
echo $SECRET_NUMBER
SAVE_GAME() {
  if [[ $NEW ]]
    then
      INSERT_USER=$($PSQL "INSERT INTO users(username, score, game_count) VALUES('$USERNAME', $1, 1)")
    else
      UPDATE_USER=$($PSQL "UPDATE users set game_count=game_count+1 WHERE username='$USERNAME'")
      if [[ $1 -lt $BEST_SCORE ]]
        then UPDATE_USER=$($PSQL "UPDATE users set score=$BEST_SCORE WHERE username='$USERNAME'")
      fi
  fi
}

echo Guess the secret number between 1 and 1000:
MAIN(){
  NUMBER_GUESSES=$(( NUMBER_GUESSES+1 ))
  
  read USER_INPUT

  if [[ ! $USER_INPUT =~ ^[0-9]+$ ]]
    then 
      echo That is not an integer, guess again:
      MAIN
  fi

  if [[ $USER_INPUT -eq $SECRET_NUMBER ]]
    then 
      echo You guessed it in $NUMBER_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!
      SAVE_GAME $NUMBER_GUESSES
      exit
    elif [[ $USER_INPUT -lt $SECRET_NUMBER ]]
      then 
        echo "It's higher than that, guess again:"
    else 
      echo "It's lower than that, guess again:"
  fi
  MAIN
}

MAIN