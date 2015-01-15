cache:
	mkdir -p cache
	wget http://www.emacswiki.org/cgi-bin/wiki?action=elisp -O cache/emacswiki.html
	wget https://raw.github.com/dimitri/el-get/master/el-get-install.el -O cache/el-get-install.el

all:
	env HOME=`pwd` `which emacs` --daemon=ghost
	env HOME=`pwd` gnome-terminal -e "emacsclient -t -s ghost" &
