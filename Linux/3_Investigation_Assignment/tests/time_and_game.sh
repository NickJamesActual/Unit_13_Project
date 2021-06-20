#!/bin/bash



#grep "$2" ./$1_Dealer_schedule | awk '{print $1,$2}' |

#case "$3" in
#	BlackJack)
#		awk '{print $3,$4}'
#	;;
#	Roulette)
#		awk '{print $5,$6}'
#	;;
#	TexadHoldem)
#		awk '{print $7,$8}'
#	;;
#	*)
#	echo "Please enter \'Blackjack\' \'Roulette\' or \'TexasHoldem\'"
#	;;
#esac

case "$3" in
   "BlackJack") grep "$2" ./$1_Dealer_schedule | awk '{print $1,$2,$3,$4}'
   ;;
   "Roulette")  grep "$2" ./$1_Dealer_schedule | awk '{print $1,$2,$5,$6}'
   ;;
   "Holdem")    grep "$2" ./$1_Dealer_schedule | awk '{print $1,$2,$7,$8}'
   ;;
esac
