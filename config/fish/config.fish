# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

set fish_color_autosuggestion yellow

set -x EDITOR vim

set fish_greeting ""

set --universal fish_user_paths ~/.local/scripts ~/.local/bin node_modules/.bin ~/.yarn/bin
