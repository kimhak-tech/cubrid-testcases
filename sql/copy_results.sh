#!/bin/bash

# Path to the file containing test cases
FILE="run_cci_files.txt"

# Base directory where the test cases are located
BASE_DIR="/home/kimhak/cubrid-testcases/sql"

# Check if the file exists
if [[ ! -f "$FILE" ]]; then
    echo "File $FILE not found!"
    exit 1
fi

# Loop through each test case listed in the run_files.txt
while IFS= read -r testcase; do
    if [[ -n "$testcase" ]]; then # Skip empty lines
        # Construct the full path to the testcase
        full_testcase_path="${BASE_DIR}/${testcase}"

        # Extract the base directory path (excluding 'cases')
        base_dir=$(dirname "$full_testcase_path")
        
        # Adjust to get the 'answers' directory (one level up from 'cases')
        answer_dir="${base_dir%/cases}/answers"
        
        # Extract the base filename (without extension)
        base_filename=$(basename "$testcase" .sql)
        
        # Construct the result file path
        result_file="${full_testcase_path/.sql/.result}"
        
        # Construct the answer file path
        answer_file="${answer_dir}/${base_filename}.answer_cci"

        # Check if the result file exists
        if [[ -f "$result_file" ]]; then
            echo "Copying $result_file to $answer_file"
            
            # Ensure the 'answers' directory exists before copying
            mkdir -p "$answer_dir"
            
            # Copy the result file to the answer file path
            cp "$result_file" "$answer_file"
        else
            echo "Result file $result_file not found for testcase $testcase"
        fi
    fi
done < "$FILE"
