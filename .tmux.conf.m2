# unbind default prefix and set it to C-a
unbind C-b
set -g prefix C-a
bind C-a send-prefix

set -g mouse on

# no escape delay
set -sg escape-time 0

# start windows and panes at 1, not 0
set -g base-index 1
setw -g pane-base-index 1

# reload config file with C-a r
bind r source-file ~/.tmux.conf \; display ".tmux.conf reloaded!"

# pane movement shortcuts (same as vim)
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# session management
bind c new-window -c "#{pane_current_path}"

# resize panes like vim
# feel free to change the "1" to however many lines you want to resize by, only
# one at a time can be slow
bind < resize-pane -L 5
bind > resize-pane -R 5
bind - resize-pane -D 5
bind + resize-pane -U 5

# split windows like vim
# vim's definition of a horizontal/vertical split is reversed from tmux's
bind s split-window -v -c "#{pane_current_path}"
bind v split-window -h -c "#{pane_current_path}"

# vi-style controls for copy mode
setw -g mode-keys vi
bind-key -T copy-mode-vi 'v' send -X begin-selection
bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel

# status color
set -g status-style bg=default,fg=white

# left side of status bar holds "(>- session name -<)"
set -g status-left-style bg=green,fg=black,bold
set -g status-left-length 100
set -g status-left ''

# right side of status bar holds "[host name] (date time)"
set -g status-right-style fg=default,bold
set -g status-right-length 100
set -g status-right '#[fg=cyan][#[fg=default]#S#[fg=cyan]] #[fg=magenta][#[fg=default]#T#[fg=magenta]]#[default] #[fg=blue](#[fg=default]%d-%b-%y %H:%M#[fg=blue])#[default] '

# make background window look like white tab
set-window-option -g window-status-style bg=default,fg=colour250,none
set-window-option -g window-status-format ' \(#I) #W/ '

# make foreground window look like bold yellow foreground tab
set-window-option -g window-status-current-style bg=default,fg=yellow,none
set-window-option -g window-status-current-format '\#[bg=default,underscore] (#I) #W #[default]/'

# active terminal yellow border, non-active white
set -g pane-border-style bg=default,fg=white
set -g pane-active-border-style bg=default,fg=yellow
