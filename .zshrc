# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Add custom functions to fpath
fpath=(~/.zsh/functions $fpath)
autoload -Uz gc-ai

# ========================== PERSONAL ALIASES ==========================

# Show aliases
alias 'rlias'='code ~/.zprezto/modules/ruby/init.zsh'
alias 'rorlias'='code ~/.zprezto/modules/rails/init.zsh'
alias 'glias'='code ~/.zprezto/modules/git/alias.zsh'
alias 'dlias'='code ~/.zprezto/modules/docker/alias.zsh'
alias 'hblias'='code ~/.zprezto/modules/homebrew/alias.zsh'
alias 'be'='bundle exec'
alias 'yt'='~/.local/bin/yt-dlp'
alias 'cd'='z'
alias 'code'='cursor'

# Rails
alias 'rc'='bundle exec rails c'
alias 'rs'='bundle exec rails s'
alias 'rec'='bundle exec rspec'
alias 'rdm'='bundle exec rails db:migrate'
alias 'rdr'='bundle exec rails db:rollback:primary'

# Prettier
alias 'pw'='bun run prettier --write'
alias 'pwe'="git diff --name-only HEAD development | grep -E '\.(rb|js|jsx|ts|tsx)$' | xargs -r bun run prettier --write"

# Tapioca + Sorbet type check
alias 'tpc'="bin/tapioca_generate && bin/tapioca_verify && bundle exec srb tc -a"

# Rubocop autocorrect on changed files
alias 'rbc'='bundle exec rubocop -a $(git diff --name-only --diff-filter=ACMRTUXB origin/development... | grep "\.rb$" || true)'
alias 'rbC'='bundle exec rubocop -A $(git diff --name-only --diff-filter=ACMRTUXB origin/development... | grep "\.rb$" || true)'

# Heroku CLI
alias 'hpc'="heroku run -a halocures-production 'rails c'"

# ========================== END OF PERSONAL ALIASES ==========================

eval "$(zoxide init zsh)"

# Set up GPG
export GPG_TTY=$(tty)
export EDITOR='cursor -w'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# export PATH="$PATH:/opt/homebrew/opt/openssl@1.1/bin"
export PATH="$PATH:/usr/local/mysql/bin"
export PATH="$PATH:/usr/local/texlive/2025basic/bin/universal-darwin"
export PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"

# Yarn global bin
export PATH="$PATH:/Users/mikita/.yarn/bin"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/mikita/.lmstudio/bin"

# Added by Windsurf
export PATH="/Users/mikita/.codeium/windsurf/bin:$PATH"
export PATH="$(npm config get prefix)/bin:$PATH"

# Added by Cursor
export PATH="$HOME/.local/bin:$PATH"

# bun completions
[ -s "/Users/mikita/.bun/_bun" ] && source "/Users/mikita/.bun/_bun"
eval "$(mise activate zsh)"
export PATH="/Users/mikita/.bun/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@3.5/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3.5/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3.5/lib/pkgconfig"

# Machine-specific configs (not tracked in git)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
