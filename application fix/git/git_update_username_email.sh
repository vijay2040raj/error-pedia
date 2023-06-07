#!/bin/bash

read -p "Enter your new username: " new_username
read -p "Enter your new email address: " new_email

while true; do
    read -p "Choose an option:
    1) Set globally
    2) Set locally
    3) Reset to default
    4) Reset after commit
    5) Exit
    Enter your choice (1/2/3/4/5): " choice

    case $choice in
        1)
            git config --global user.name "$new_username"
            git config --global user.email "$new_email"

            echo "Git username and email updated globally."
            ;;
        2)
            git config user.name "$new_username"
            git config user.email "$new_email"

            echo "Git username and email updated locally."
            ;;
        3)
            git config --global --unset-all user.name
            git config --global --unset-all user.email

            echo "Git username and email reset to default globally."
            ;;
        4)
            git commit --amend --reset-author --no-edit

            git config --local user.name "$new_username"
            git config --local user.email "$new_email"

            echo "Git username and email updated for the last commit."
            ;;
        5)
            echo "Exiting the script. Bye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done

