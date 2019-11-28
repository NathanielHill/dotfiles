function song
	set -l CWD $PWD
	cd ~/Music
	command youtube-dl -vx --audio-format "vorbis" $argv; 
	cd $CWD
end
