#!/bin/bash

# This script calculates the user's age in days based on their input of years.

# Prompt the user to enter their age in years
echo "Hello! Welcome to the age calculator."

# Read user input and store it in a variable
read -p "Enter your age in years: " age_years

# Check if the input is a valid number using regex
if [[ ! $age_years =~ ^[0-9]+$ ]]; then
    # If the input is not a number, show an error and exit the script
    echo "Error: Please enter a valid number for your age."
    exit 1
fi

# Convert the age from years to days (assuming 365 days per year)
age_days=$((age_years * 365))

# Display the result to the user
echo "You are approximately $age_days days old!"

# Script ends here
echo "Thank you for using the age calculator. Have a great day!"
