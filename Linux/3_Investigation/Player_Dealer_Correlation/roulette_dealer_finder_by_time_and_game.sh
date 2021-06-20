#!/bin/bash

case "$3" in
	"BlackJack") grep "$2" ./$1_Dealer_schedule | awk '{print $1,$2,$3,$4}'
	;;
	"Roulette")  grep "$2" ./$1_Dealer_schedule | awk '{print $1,$2,$5,$6}'
	;;
	"Holdem")    grep "$2" ./$1_Dealer_schedule | awk '{print $1,$2,$7,$8}'
	;;
	*)
	echo -e  "\e[31mERROR:\e[0m Please enter BlackJack, Roulette, or Holdem"
	;;
esac
