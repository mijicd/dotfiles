# exports
set -U fish_user_paths ~/.local/bin $fish_user_paths
set -x LANG en_US.UTF-8
set -x LESS '--ignore-case --raw-control-chars'
set -x PAGER less

# useful aliases
function ..     ; cd ..             ; end
function ...    ; cd ../..          ; end
function ....   ; cd ../../..       ; end
function l      ; ls -al $argv      ; end
function ll     ; ls -GFhl $argv    ; end
function vi     ; nvim $argv        ; end

# git
function ga     ; git add $argv         ; end
function gc     ; git commit -m $argv   ; end
function gcb    ; git checkout -b $argv ; end
function gcl    ; git clone $argv       ; end
function gco    ; git checkout $argv    ; end
function gd     ; git diff              ; end
function gp     ; git push              ; end
function gpu    ; git pull --rebase     ; end
function gs     ; git status            ; end
