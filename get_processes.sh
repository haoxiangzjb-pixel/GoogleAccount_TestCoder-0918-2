#!/bin/bash

# Bash script to get processes and save to a file with a random name
random_name="438cc38741d9c30801105abc96e9e3ef"
output_path="/workspace/${random_name}.txt"

# Get the list of processes and save to the file
ps aux > "$output_path"

echo "Process list saved to $output_path"