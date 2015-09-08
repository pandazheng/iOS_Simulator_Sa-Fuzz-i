#!/bin/bash
clear;
echo -e "Checking for arguments...\n"
if [ $# -eq 0 ]; then
    echo -e "No arguments provided!\n"
    echo -e "usage: $0 <location of file> <filename>\n"
    echo "Location of file: The location of the file you want to use [Full Path]."
    echo -e "Filename: The name of the file you want to use. [Just the name + extension].\n"
    exit 1
fi
echo "Running...";
while true
do
	python goSim.py $1/ $2
	echo -e "\nPress CTRL + Z to Quit.\n\n";
done
clear
