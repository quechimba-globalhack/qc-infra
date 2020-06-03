#!/bin/bash
## xcrun simctl list
declare -a simulators=("C1E4CF87-FB75-4E0A-9C14-CFF6B464E3A2" "234D3F4E-E121-4137-BAE5-9B5A6923D32E")

for i in "${simulators[@]}"
do
    xcrun instruments -w $i
    xcrun simctl openurl $i http://127.0.0.1:5000      
done
