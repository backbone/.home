DEFAULT_SESSION=awesome

case $1 in
urxvt)
	exec urxvt
	;;
awesome)
	exec awesome
	;;
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
