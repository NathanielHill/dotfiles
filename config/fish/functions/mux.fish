function mux
	set -l CWD $PWD
	cd ~
	/usr/local/bin/tmuxinator $argv; 
	cd $CWD
end
