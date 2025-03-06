#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 \"your command here\""
    exit 1
fi

# Get the current working directory
CURRENT_DIR=$(pwd)

# Run Ollama with the specified prompt and include the current directory
OLLAMA_OUTPUT=$(ollama run granite3.1-dense:2b "You are an expert in shell scripting, only respond with shell script for whatever I ask: $1. The current working directory is $CURRENT_DIR; only generate the code - no extra information required")

# Extract only the code part using sed (assuming code is enclosed in backticks or follows a pattern)
EXTRACTED_SCRIPT=$(echo "$OLLAMA_OUTPUT" | sed -n '/```/,/```/p' | sed '1d;$d')

# If no extracted script is found, fallback to using full response
if [ -z "$EXTRACTED_SCRIPT" ]; then
    EXTRACTED_SCRIPT="$OLLAMA_OUTPUT"
fi

# Print extracted script for debugging
#echo "Executing Script:"
#echo "$EXTRACTED_SCRIPT"

# Run the extracted script and print results
eval "$EXTRACTED_SCRIPT"

