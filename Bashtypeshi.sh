#!/bin/bash

function play_game {
    # Set difficulty level
    echo "Select difficulty level: (1) Easy (2) Medium (3) Hard"
    read -p "Enter your choice (1-3): " difficulty

    case $difficulty in
        1)
            random_number=$(( RANDOM % 50 + 1 ))
            max_attempts=15
            ;;
        2)
            random_number=$(( RANDOM % 100 + 1 ))
            max_attempts=10
            ;;
        3)
            random_number=$(( RANDOM % 200 + 1 ))
            max_attempts=5
            ;;
        *)
            echo "Invalid choice. Defaulting to Medium difficulty."
            random_number=$(( RANDOM % 100 + 1 ))
            max_attempts=10
            ;;
    esac

    attempts=0
    guess=0

    echo "Welcome to the Number Guessing Game!"
    echo "I have chosen a number between 1 and $(($max_attempts == 15 ? 50 : ($max_attempts == 10 ? 100 : 200))). You have $max_attempts attempts to guess it."

    # Loop until the user guesses the correct number or runs out of attempts
    while [ $guess -ne $random_number ] && [ $attempts -lt $max_attempts ]
    do
        read -p "Enter your guess: " guess
        attempts=$((attempts + 1))

        if [ $guess -lt $random_number ]; then
            echo "Too low!"
            if [ $attempts -gt 3 ]; then
                echo "Hint: The number is greater than $((guess + 10))."
            fi
        elif [ $guess -gt $random_number ]; then
            echo "Too high!"
            if [ $attempts -gt 3 ]; then
                echo "Hint: The number is less than $((guess - 10))."
            fi
        else
            echo "Congratulations! You guessed the correct number: $random_number"
            echo "It took you $attempts attempts."
        fi

        if [ $attempts -eq $max_attempts ]; then
            echo "Sorry, you've used all your attempts! The correct number was $random_number."
        fi
    done
}

while true; do
    play_game
    read -p "Do you want to play again? (yes/no): " play_again
    if [[ $play_again != "yes" ]]; then
        echo "Thank you for playing! Goodbye!"
        break
    fi
done