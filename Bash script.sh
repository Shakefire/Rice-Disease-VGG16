#!/bin/bash

# Clone the GitHub repository
git clone <repository_link>
cd <repository_name>

# Create a CSV file
echo "Email,Area of Interest" > bioinfo.csv

# Loop through scripts and append outputs
for script in *.py *.r *.sh *.pl *.java; do
  output=$(python3 "$script" | grep -E 'Email|Area of Interest' | awk -F': ' '{print $2}')
  email=$(echo "$output" | sed -n '1p')
  interest=$(echo "$output" | sed -n '2p')
  echo "$email,$interest" >> bioinfo.csv
