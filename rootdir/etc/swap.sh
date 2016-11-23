#!/system/bin/sh

SWAP_FILE="/data/.swapfile"
SWAP_SIZE="20" 
SWAPPINESS_OPTION="100"
SWITCH=`cat /proc/swaps | grep $SWAP_FILE`

if [[ $SWITCH != "" ]]; then
	busybox swapoff $SWAP_FILE
	rm $SWAP_FILE
else
	echo $SWAPPINESS_OPTION > /proc/sys/vm/swappiness
	busybox dd if=/dev/zero of=$SWAP_FILE bs=1M count=$SWAP_SIZE
	busybox mkswap $SWAP_FILE
	busybox swapon $SWAP_FILE
fi
