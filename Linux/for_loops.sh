#!/bin/bash

# variables
states=(Oregon California Washington Nebraska Mississippi "New York")

for state in "${states[@]}"
do
  echo "$state"
  if [ "$state" == Nebraska ]
  then
    echo "Nebraska number 1!"
  else
    echo $state is just okay
  fi
done

