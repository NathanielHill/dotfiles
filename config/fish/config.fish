# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red
set __fish_git_prompt_show_informative_status 'yes'

# function fish_prompt
#  set last_status $status
#
#  set_color $fish_color_cwd
#  printf '%s' (prompt_pwd)
#  set_color normal
#
#  printf '%s ' (__fish_git_prompt)
#
#  set_color normal
#end

#set fish_function_path $fish_function_path "/usr/local/lib/python2.7/dist-packages/powerline/bindings/fish"
#powerline-setup
#
set -x EDITOR vim
