#!/bin/bash

# Set number of rows and columns
echo "Enter number of rows:"
read rows

echo "Enter number of columns:"
read columns

# Create two-level matrix and fill it
declare -A matrix
echo "Enter matrix elements separated by spacebar:"
for ((i=0; i<$rows; i++))
do
  read -a row
  for ((j=0; j<$columns; j++))
  do
    matrix[$i,$j]=${row[$j]}
  done
done

# Output matrix
for ((i=0; i<$rows; i++))
do
  row=""
  for ((j=0; j<$columns; j++))
  do
    row+=" ${matrix[$i,$j]}"
  done
  echo "$row"
done
