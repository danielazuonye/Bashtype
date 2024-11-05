#!/bin/bash

# Initialize variables
user_score=0
computer_score=0

# Function to generate the computer's choice
generate_computer_choice() {
    options=("rock" "paper" "scissors")
    echo "${options[RANDOM % 3]}"
}

# Function to determine the winner
determine_winner() {
    if [[ $user_choice == $computer_choice ]]; then
        echo "It's a tie!"
    elif [[ ($user_choice == "rock" && $computer_choice == "scissors") ||
            ($user_choice == "scissors" && $computer_choice == "paper") ||
            ($user_choice == "paper" && $computer_choice == "rock") ]]; then
        echo "You win this round!"
        user_score=$((user_score + 1))
    else
        echo "Computer wins this round!"
        computer_score=$((computer_score + 1))
    fi
}

# Convert numeric input to text
convert_input() {
    case $1 in
        1) echo "rock" ;;
        2) echo "paper" ;;
        3) echo "scissors" ;;
        *) echo "$1" ;;  # return the input as is if not 1, 2, or 3
    esac
}

# Game loop
while true; do
    echo "Choose rock, paper, or scissors (or type 'quit' to end the game):"
    echo "You can also enter 1 for rock, 2 for paper, or 3 for scissors."
    read -p "Your choice: " user_choice

    if [[ $user_choice == "quit" ]]; then
        echo "Final Scores - You: $user_score, Computer: $computer_score"
        break
    fi

    # Convert numeric choices to words if necessary
    user_choice=$(convert_input $user_choice)

    # Validate user choice
    if [[ $user_choice != "rock" && $user_choice != "paper" && $user_choice != "scissors" ]]; then
        echo "Invalid choice. Please try again."
        continue
    fi

    # Generate and display the computer's choice
    computer_choice=$(generate_computer_choice)
    echo "Computer chose: $computer_choice"

    # Determine the winner and update scores
    determine_winner
    echo "Score - You: $user_score, Computer: $computer_score"
    echo "----------------------------"
done

