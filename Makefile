cache:
	mkdir -p cache
	cd cache && ln -s /home/eab/.emacs.d/el-get el-getmirror
	cd cache && ln -s /home/eab/newemacs/emacswiki.html emacswiki.html
	wget https://raw.github.com/dimitri/el-get/master/el-get-install.el -O cache/el-get-install.el
	cd cache && ln -s /home/eab/newemacs/elpamirror

all:
	env HOME=`pwd` `which emacs` --daemon=ghost
	env TERM=eterm-color HOME=`pwd` emacsclient -s ghost --eval "(eab/loaded-ok)"
	@if (test -e ./dotemacs.error); then rm ./dotemacs.error; echo "ERROR! dotemacs did not loaded correctly"; return 1; else echo "dotemacs loaded ok"; fi

gnome:
	env HOME=`pwd` `which emacs` --daemon=ghost
	gnome-terminal . --command "env TERM=xterm-256color HOME=`pwd` emacsclient -t -s ghost"

tmux:
	env HOME=`pwd` `which emacs` --daemon=ghost
	tmux new-window 'env TERM=xterm-256color HOME=`pwd` emacsclient -t -s ghost'

clear:
	cd .emacs.d && rm -rf el-get/
