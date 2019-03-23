# Defined in /home/nhill/.config/fish/functions/ls.fish @ line 1
function ls
	env LC_COLLATE=C ls -hl -Isnap --color=always $argv;
end
