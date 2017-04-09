# Colors
set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red
set __fish_git_prompt_show_informative_status 'yes'

# Status Chars
set __fish_git_prompt_char_cleanstate '✔ '
set __fish_git_prompt_char_dirtystate '✚ '
set __fish_git_prompt_char_stagedstate '● '
set __fish_git_prompt_char_untrackedfiles '…'
set __fish_git_prompt_char_stashstate '↩ '
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'


function fish_prompt --description 'Write out the prompt'
# Just calculate this once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	end

	set -l color_cwd
	set -l suffix
	switch $USER
		case root toor
			if set -q fish_color_cwd_root
				set color_cwd $fish_color_cwd_root
			else
				set color_cwd $fish_color_cwd
			end
			set suffix '#'
		case '*'
			set color_cwd $fish_color_cwd
			set suffix '>'
	end

#set last_status $status

#set_color $fish_color_cwd
#printf '%s' (prompt_pwd)
#set_color normal

#printf '%s ' (__fish_git_prompt)

  set_color normal

	echo -n -s "$USER" @ "$__fish_prompt_hostname" (__fish_git_prompt) ' ' (set_color $color_cwd) (prompt_pwd) (set_color normal) "$suffix "


	if set -q VIRTUAL_ENV
		echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
	end
end



#set fish_function_path $fish_function_path "/usr/local/lib/python2.7/dist-packages/powerline/bindings/fish"

	set -x PROJECT_HOME ~/Projects/
	set -x EDITOR vim

eval (python3 -m virtualfish auto_activation global_requirements projects)

set fish_greeting ""

set --universal fish_user_paths ~/.local/bin ~/Anaconda3/bin
