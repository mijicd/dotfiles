source ~/.zplug/init.zsh

# history
zplug "changyuheng/fz", defer:1
zplug "rupa/z", use:z.sh

# theme
zplug "dikiaap/dotfiles", from:github, use:".oh-my-zsh/themes/oxide.zsh-theme", as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    zplug install
fi

zplug load
