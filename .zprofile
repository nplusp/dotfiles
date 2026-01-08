
eval "$(/opt/homebrew/bin/brew shellenv)"
ssh-add macbook-14.pem >/dev/null 2>&1

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# Theme
# source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
export LC_ALL=en_US.UTF-8
