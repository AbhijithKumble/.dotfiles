# export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# plugins=(git)

# source $ZSH/oh-my-zsh.sh
# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/.zsh_profile

#go 

export GOPATH="$HOME/go/bin"
export PATH="$GOPATH":"$PATH"

###android studio
## export ANDROID_HOME="/home/abhi/Android/Sdk"
## export PATH="$ANDROID_HOME:$PATH"
## export PATH="$ANDROID_HOME/platform-tools:$PATH"
## export PATH="$ANDROID_HOME/emulator:$PATH"
## 
## #firestore android
## export PATH="$HOME/.pub-cache/bin:$PATH"
## 
## # pnpm
## export PNPM_HOME="/home/abhi/.local/share/pnpm"
## case ":$PATH:" in
##   *":$PNPM_HOME:"*) ;;
##   *) export PATH="$PNPM_HOME:$PATH" ;;
## esac
## # pnpm end
## 
# . "$HOME/.local/bin/env"
export PATH="$HOME/.cargo/bin:$PATH"

setopt PROMPT_SUBST
ANTIDOTE_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/antidote"

# Auto-clone if missing on a fresh machine
if [[ ! -d "$ANTIDOTE_HOME" ]]; then
  git clone --depth=1 https://github.com/mattmc3/antidote.git "$ANTIDOTE_HOME"
fi

source "$ANTIDOTE_HOME/antidote.zsh"
antidote load "${ZDOTDIR:-$HOME}/.zsh_plugins.txt"
