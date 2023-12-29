# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# modules
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light greymd/docker-zsh-completion

# tip the alias command is there
zinit light djui/alias-tips

# Oh My Zsh feature
zinit snippet OMZL::history.zsh
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::theme-and-appearance.zsh

# Oh My Zsh plugins
zinit snippet OMZP::sudo/sudo.plugin.zsh
zinit snippet OMZP::pip/pip.plugin.zsh
zinit snippet OMZP::git-prompt/git-prompt.plugin.zsh

# not checked
zinit snippet OMZP::colored-man-pages


# p10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Source customize configuration
[[ ! -f ~/.zalias ]] || source ~/.zalias
[[ ! -f ~/.zbind ]] || source ~/.zbind
[[ ! -f ~/.zenv ]] || source ~/.zenv

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
