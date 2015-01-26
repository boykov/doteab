cache:
	mkdir -p cache
	wget http://www.emacswiki.org/cgi-bin/wiki?action=elisp -O cache/emacswiki.html
	wget https://raw.github.com/dimitri/el-get/master/el-get-install.el -O cache/el-get-install.el
	cd cache && git clone http://github.com/dimitri/el-get.git
	cd cache && git clone https://github.com/boykov/eab-misc.git
	cd cache && git clone https://github.com/boykov/eab-dotemacs.git
	cd cache && git clone https://github.com/boykov/ace-jump-mode.git
	cd cache && git svn clone http://ergoemacs.googlecode.com/svn/trunk/ergoemacs/ergoemacs-keybindings
	cd cache && ln -s /home/eab/newemacs/elpamirror
	# cd cache && wget http://dl.getdropbox.com/u/1897885/eabelpamirror.tar.gz
	# cd cache && tar -xvzf eabelpamirror.tar.gz

all:
	env HOME=`pwd` `which emacs` --daemon=ghost
	env HOME=`pwd` emacsclient -t -s ghost --eval "(eab/loaded-ok)"
	@if (test -e ./dotemacs.error); then rm ./dotemacs.error; echo "ERROR! dotemacs did not loaded correctly"; return 1; else echo "dotemacs loaded ok"; fi
