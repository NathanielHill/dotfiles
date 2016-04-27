function mux
	set -l CWD $PWD
	cd ~
	command tmuxinator $argv; 
	cd $CWD
end
