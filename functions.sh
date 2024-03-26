#!/bin/bash

# Function definitions

# Function to print colored text
print_colored_text() {
    local class=$1
    local text=$2
    local color=$(echo "$LS_COLORS" | grep -o "$class[^:]*" | sed 's/.*=//')
    if [ -n "$color" ]; then
        echo -e "\e[${color}m$text\e[0m"
    else
        echo "$text"  # Print without color if color not defined
    fi
}

# Function to list available classes and their colors
list_classes() {
    echo "Available classes and their colors:"
    echo "$LS_COLORS" | awk -F'=' '{print $1}'
}

# Function to add a new class and its color
add_class() {
    echo "Enter class name:"
    read class_name
    echo "Enter color code (e.g., 01;34 for blue):"
    read color_code
    export LS_COLORS="$LS_COLORS:$class_name=$color_code"
    echo "Class '$class_name' added with color '$color_code'."
}

# Function to remove a class and its color
remove_class() {
    echo "Enter class name to remove:"
    read class_name
    export LS_COLORS=$(echo "$LS_COLORS" | sed "s/${class_name}[^:]*://")
    echo "Class '$class_name' removed."
}

