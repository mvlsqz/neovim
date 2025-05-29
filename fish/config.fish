if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias vim=nvim
set -gx EDITOR nvim
set -gx VISUAL nvim

set -gx NVM_DIR ~/.nvm
set -gx NVM_NODEJS_ORG_MIRROR https://artifactory.paypalcorp.com/artifactory/nodejs-dist
set -gx NODEJS_ORG_MIRROR https://artifactory.paypalcorp.com/artifactory/nodejs-dist
set -gx NODE_EXTRA_CA_CERTS /usr/local/etc/openssl/certs/paypal_proxy_cacerts.pem

set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/local/bin $PATH
source ~/.config/fish/secrets.fish

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
    eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" hook $argv | source
else
    if test -f "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
        . "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
    else
        set -x PATH /opt/homebrew/Caskroom/miniconda/base/bin $PATH
    end
end
# <<< conda initialize <<<

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/mvelasquez/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
