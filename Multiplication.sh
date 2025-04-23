#!/bin/bash

# Prompt the user for a number
read -p "Enter a number: " num

# Validate input
if ! [[ "$num" =~ ^[0-9]+$ ]]; then
    echo "Invalid input! Please enter a positive number."
    exit 1
fi

# Ask the user if they want a partial or full table
echo "Do you want a partial table or full table?"
echo "1. Partial (Choose a custom range)"
echo "2. Full (Up to 12)"
read -p "Enter your choice (1 or 2): " choice

if [ "$choice" -eq 1 ]; then
    read -p "Enter the starting multiplier: " start
    read -p "Enter the ending multiplier: " end

    # Validate start and end values
    if ! [[ "$start" =~ ^[0-9]+$ ]] || ! [[ "$end" =~ ^[0-9]+$ ]]; then
        echo "Invalid input! Switching to full table..."
        start=1
        end=12
    elif [ "$start" -gt "$end" ]; then
        echo "Invalid range! The starting number must be less than or equal to the ending number."
        echo "Switching to full table..."
        start=1
        end=12
    fi

elif [ "$choice" -eq 2 ]; then
    start=1
    end=12
else
    echo "Invalid choice! Please enter 1 or 2."
    exit 1
fi

# Generate the multiplication table
echo "Multiplication table for $num (from $start to $end):"
for ((i=start; i<=end; i++)); do
    echo "$num x $i = $((num * i))"
done
