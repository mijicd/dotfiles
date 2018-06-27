# use vi settings
bindkey -v

# remap escape key
bindkey -M viins 'fd' vi-cmd-mode

# history navigation
bindkey '^R' history-incremental-search-backward
