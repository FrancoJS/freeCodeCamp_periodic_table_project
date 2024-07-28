#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

MAIN(){
  if [[ ! $1 ]]
  then
    echo "Please provide an element as an argument."
  fi
  
  if [[ $1 =~ ^[0-9]+$ ]]
  then
  IFS='|' read -r ATOMIC_NUMBER SYMBOL NAME TYPE ATOMIC_MASS MELTING_P_C BOILING_P_C < <($PSQL "select elements.atomic_number, symbol,name, type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements inner join properties on elements.atomic_number = properties.atomic_number inner join types on types.type_id = properties.type_id where elements.atomic_number = $1")
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_P_C celsius and a boling point of $BOILING_P_C celsius."
  fi
}

MAIN $1
