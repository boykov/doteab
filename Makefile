all:
	env HOME=`pwd` `which emacs` --daemon=ghost
	env HOME=`pwd` gnome-terminal -e "emacsclient -t -s ghost" &
