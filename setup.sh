#!/bin/bash

# Function: Typing animation
type_text() {
    text="$1"
    delay="${2:-0.05}"
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep $delay
    done
    echo ""
}

# Clear screen fast
fast_clear() {
    clear
    echo -e "\e[1;32m"  # Green color
}

# Dragon ASCII Logo
show_logo() {
fast_clear
echo "          /\\                     /\\"
echo "         /  \\___________________/  \\"
echo "        |   DRAGON YASIR TOOL    |"
echo "         \\_____________________/ "
echo ""
}

# Main Menu
main_menu() {
    show_logo
    type_text "[1] Setup Install" 0.03
    type_text "[2] Run Nmap Scan" 0.03
    type_text "[3] Fast Clear Terminal" 0.03
    type_text "[4] Exit" 0.03
    echo ""
    read -p "Choose option: " choice

    case $choice in
        1)
            type_text "Starting Setup..." 0.03
            pkg update -y && pkg upgrade -y
            pkg install -y git curl wget nano python nmap
            pip install requests
            mkdir -p ~/projects ~/tools
            type_text "Setup Completed Successfully!" 0.03
            sleep 1
            main_menu
            ;;
        2)
            read -p "Enter target IP/URL: " target
            type_text "Running Nmap Scan on $target ..." 0.03
            nmap $target
            type_text "Scan Completed!" 0.03
            sleep 1
            main_menu
            ;;
        3)
            fast_clear
            type_text "Terminal Cleared!" 0.03
            sleep 1
            main_menu
            ;;
        4)
            type_text "Exiting..." 0.03
            exit
            ;;
        *)
            type_text "Invalid option!" 0.03
            sleep 1
            main_menu
            ;;
    esac
}

# Run Menu
main_menu
