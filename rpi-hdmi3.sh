#!/bin/sh

# Enable and disable HDMI output on the Raspberry Pi

is_off ()
{
	vcgencmd display_power | grep "display_power=0" >/dev/null
}

case $1 in
	off)
        	if is_off
        	then
            		echo Already off...
        	else
            		vcgencmd display_power 0
        	fi
	;;
	on)
		if is_off
		then
			vcgencmd display_power 1
        	else
            		echo Already on...
		fi
	;;
        toggle)
                if is_off
                then
                        vcgencmd display_power 1
			#echo on!!!!
                else
                        vcgencmd display_power 0
			#echo off!!!
                fi
        ;;
	status)
		if is_off
		then
			echo off
		else
			echo on
		fi
	;;
	*)
		echo "Usage: $0 on|off|toggle|status" >&2
		exit 2
	;;
esac

exit 0
