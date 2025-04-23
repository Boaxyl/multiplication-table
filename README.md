# Explanation of the Multiplication Table Script

## Introduction
In this project, I created a **Bash script** that allowed users to generate a **multiplication table** based on their preferences. The script prompted the user for a number and offered two choices: a **partial table** (where the user could specify a range) or a **full table** (up to 12). If the user entered an invalid range, the script automatically switched to the full table.

## Steps & Execution

### 1. Initializing the Script
I started the script with the **shebang**:
```bash
#!/bin/bash

This ensured the system executed the script using the Bash interpreter.
2. Prompting for a Number
I used the read command to prompt the user for a number:
read -p "Enter a number: " num
I then validated the input using a regular expression to ensure it was a positive number:
if ! [[ "$num" =~ ^[0-9]+$ ]]; then
    echo "Invalid input! Please enter a positive number."
    exit 1
fi
If the input was invalid, I displayed an error message and exited the script.
Asking the User for Table Type
I presented two options:
- Partial table (user-defined range)
- Full table (up to 12)
The user was prompted to enter their choice:
read -p "Enter your choice (1 or 2): " choice
Handling Partial Table Selection
If the user selected option 1, I prompted them for a starting and ending multiplier:
read -p "Enter the starting multiplier: " start
read -p "Enter the ending multiplier: " end
I validated these inputs using the same numeric check as before.
Handling Invalid Ranges
If the user entered an invalid range (non-numeric values or start > end), I displayed an error and automatically switched to the full table:
echo "Invalid input! Switching to full table..."
start=1
end=12
This ensured the user always received a valid multiplication table.
Handling Full Table Selection
If the user selected option 2, I set the range to 1 through 12:
start=1
end=12
Generating the Multiplication Table
Using a for loop, I iterated through the specified range:
for ((i=start; i<=end; i++)); do
    echo "$num x $i = $((num * i))"
done


This displayed the multiplication table dynamically.


