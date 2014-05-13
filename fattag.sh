#!/bin/sh -e
# Label a vfat device, such as an SD card or USB stick.
# It uses mlabel, from mtools.
# Another way, undocumented, of which I did not know:
#   mlabel -i /dev/sdf1 ::DEVICENAME
#   mlabel -i /dev/sdf1 -s ::
# fattag may work slightly better, it also:
#   - sets mtools_skip_check=1, in case of weird device size
#   - does a sync
device="$1"
label="$2"
if [ -z "$device" -o "${device#-}" != "$device" ]; then
	prog=`basename "$0"`
	echo >&2 "usage: $prog device [label]"
	echo >&2 "fat devices:"
	blkid | sed -n '/fat/{ s/^/  /; p; }'
	exit 2
fi
bak=0
trap '
	status=$?
	if [ $bak = 1 ]; then
		mv ~/.mtoolsrc.bak.$$ ~/.mtoolsrc
	else
		rm -f ~/.mtoolsrc
	fi
	exit $status
' INT QUIT TERM PIPE EXIT
if [ -e ~/.mtoolsrc ]; then
	bak=1
	mv ~/.mtoolsrc ~/.mtoolsrc.bak.$$
fi
echo "mtools_skip_check=1
drive p: file=\"$device\"" >~/.mtoolsrc
if [ -z "$label" ]; then
	mlabel -s p: | sed 's/^ Volume label is //; s/ *$//;'
else
	mlabel p:"$label"
	sync
fi
