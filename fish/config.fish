# exports
set -U fish_user_paths ~/.local/bin $fish_user_paths
set -x LANG 'en_US.UTF-8'
set -x LC_ALL 'en_US.UTF-8'
set -x LESS '--ignore-case --raw-control-chars'
set -x PAGER less

# useful aliases
function ..     ; cd ..             ; end
function ...    ; cd ../..          ; end
function ....   ; cd ../../..       ; end
function l      ; ls -al $argv      ; end
function ll     ; ls -GFhl $argv    ; end
function vi     ; nvim $argv        ; end
