#!/bin/bash
#### BROKEN

bin_dir=$HOME/bin
gen_next=$bin_dir/gen_next_linux

printf "$(ls -1 $gen_next | grep "\<g.*sh\>")"
printf "Running all of these scripts"

read -p "Are you sure? " -n 1 -r
printf
if [[ $REPLY =~ ^[Yy]$ ]]
  then
  run-parts
  #### BROKEN