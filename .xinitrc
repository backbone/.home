DEFAULT_SESSION=urxvt

case $1 in
fvwm-crystal)
	exec fvwm-crystal
	;;
fvwm)	exec fvwm
	;;
kde)
	exec startkde
	;;
xfce4)
	exec startxfce4
	;;
fluxbox)
	exec startfluxbox
	;;
*)
	exec $DEFAULT_SESSION
	;;
esac
