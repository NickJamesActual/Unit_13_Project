#!/bin/bash

echo "0310:"
awk '{print $1,$2,$5,$6}' ./0310_Dealer_schedule | grep '5.*AM\|8\|02.*PM\|11.*PM' 
echo "0312"
awk '{print $1,$2,$5,$6}' ./0312_Dealer_schedule | grep '5.*AM\|8\|02.*PM\|11.*PM'
echo "0312" 
awk '{print $1,$2,$5,$6}' ./0315_Dealer_schedule | grep '5.*AM\|8.*AM\|02.*PM'
