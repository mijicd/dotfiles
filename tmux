# make tmux display things in 256 colors
set -g default-terminal "screen-256color"

# set scrollback history to 10000 (10k)
set -g history-limit 10000

# set ` (tic) as the default prefix key
# and unbind C-b to free it up
set -g prefix `
unbind C-b

# use send-prefix to pass ` through to application
bind ` send-prefix

# shorten command delay
set -sg escape-time 1

# set window and pane index to 1
set-option -g base-index 1
setw -g pane-base-index 1

# configuration reloading
bind r source-file ~/.tmux.conf \; display "Reloaded!"

# splitting
bind | split-window -h
bind - split-window -v

# Make the current window the first window
bind T swap-window -t 1

# map Vi movement keys as pane movement keys
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# and use C-h and C-l to cycle thru panes
bind -r C-h select-window -t :-
bind -r C-l select-window -t :+

# resize panes using PREFIX H, J, K, L
bind H resize-pane -L 5
bind J resize-pane -D 5
bind K resize-pane -U 5
bind L resize-pane -R 5

# toggle pane synchronization
bind s setw synchronize-panes

# ----------------------
# set some pretty colors
# ----------------------
# set pane colors - hilight the active pane
set-option -g pane-border-style fg=colour235 #base02
set-option -g pane-active-border-style fg=colour33 #blue

# colorize messages in the command line
set-option -g message-style bg=black,fg=brightred #orange

# ----------------------
# Status Bar
# -----------------------
set-option -g status on                # turn the status bar on
set -g status-interval 5               # set update frequency (default 15 seconds)
set -g status-justify centre           # center window list for clarity

# visual notification of activity in other windows
setw -g monitor-activity on
set -g visual-activity on

# set color for status bar
set-option -g status-style bg=colour235,fg=yellow,dim

# set window list colors - red for active and cyan for inactive
set-window-option -g window-status-style fg=brightblue,bg=colour236,dim

set-window-option -g window-status-current-style fg=brightred,bg=colour236,bright

# show host name and IP address on left side of status bar
set -g status-left-length 70
set -g status-left "#[fg=green]: #h : #[fg=brightblue]#(curl icanhazip.com) #[fg=yellow]#(ifconfig en0 | grep 'inet ' | awk '{print \"en0 \" $2}') #(ifconfig en1 | grep 'inet ' | awk '{print \"en1 \" $2}') #[fg=red]#(ifconfig tun0 | grep 'inet ' | awk '{print \"vpn \" $2}') "

# show session name, window & pane number, date and time on right side of
# status bar
set -g status-right-length 60
set -g status-right "#[fg=blue]#S #I:#P #[fg=yellow]:: %d %b %Y #[fg=green]:: %l:%M %p"

