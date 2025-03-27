#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
  then 
    echo Please provide an element as an argument.
    exit
fi

# if  number
if [[ $1 =~ ^[0-9]+$ ]]
  then FOUND=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $1")
  else FOUND=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE elements.symbol = '$1' OR elements.name = '$1'")
fi

DISPLAY() {
  echo "$FOUND" |while read TYPE_ID BAR ATOMIC_NUMBER BAR SYMBOL BAR ELEMENT_NAME BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  done
}

if [[ -z $FOUND ]]
  then echo I could not find that element in the database.
  else DISPLAY
fi
