#!/bin/bash
arg1=$1; arg2=$2;
offset=36;
mkdir logdir 2>/dev/null
filename=~/Library/Logs/CrashReporter/*
echo [*] Starting simulator.;
open /Applications/Xcode.app/Contents/Developer/Applications/iOS\ Simulator.app;
numSet=1;
setID=$(xcrun simctl list | grep -i "booted" | cut -d ")" -f1 | tail -c 37 | cut -d " " -f1);
size=${#setID};
echo "[*] Beginning next test...";
if [ $size -eq $offset ]; then
	echo "[-] Simulator started with ID $setID...";
else
        echo "[!] Simulator not found...";
        echo "Attempting to start simulator on next test...";
        exit;
fi

if [[ $arg1 ==  "-r" ]]; then
	url=$(echo $arg2 | uni2ascii -aJ);
	echo "[*] Loading : $url...";
	xcrun simctl openurl $setID $url;
fi
sleep 1
$filename logdir/ 2> /dev/null
echo "";
