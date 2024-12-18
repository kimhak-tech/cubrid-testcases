#!/bin/bash

# Path to the file containing test cases
FILE="run_cci_files.txt"

# Check if the file exists
if [[ ! -f "$FILE" ]]; then
    echo "File $FILE not found!"
    exit 1
fi

# Loop through each line in the file
while IFS= read -r testcase; do
    if [[ -n "$testcase" ]]; then # Ignore empty lines
        echo "Running: run $testcase"
        run_cci "$testcase"
    fi
done < "$FILE"
