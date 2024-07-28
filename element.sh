#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

MAIN(){
  echo "Please provide an element as an argument."
  read ELEMENT

}

MAIN
