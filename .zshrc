if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/dotnet:$HOME/Programs:$HOME/.local/bin:$HOME/.cabal/bin
# export JAVA_HOME="/usr/lib64/openjdk-11"

export ZSH="/home/paul/.oh-my-zsh"

LANG="en_US.utf8"

(cat ~/.cache/wal/sequences &)

ZSH_THEME="norm"

ENABLE_CORRECTION="true"

plugins=(sudo zsh-autosuggestions history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

### ALIASES ###

#alias java="/usr/lib64/openjdk-11/bin/java"
#alias javac="/usr/lib64/openjdk-11/bin/javac"

#general

alias news="sudo eselect news"
alias gccw="gcc -Wall -Wextra -Werror -O3"

#alias cat="bat" # bat is a better cat
alias ls="lsd" # exa is a better ls
alias ll="lsd -l"
alias la="lsd -a"

alias ..="cd .."

#alias install="sudo xbps-install"
#alias remove="sudo xbps-remove -R"
#alias query="xbps-query"
#alias queryR="xbps-query -Rs"

#alias xmonad="/home/paul/.local/bin/./xmonad"

alias uplimg='curl -F"file=@$(find $HOME -type f | dmenu -l 15)" 0x0.st | xclip -sel c'

#git

alias addorigin="git remote add origin"
alias stat="git status"
alias addall="git add ."
alias clone="git clone"
alias commit="git commit -m 'default message'"
alias fetch="git fetch"
alias pull="git pull origin"
alias push="git push origin"

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.emacs.d/bin:$PATH"
#if [ -e /home/paul/.nix-profile/etc/profile.d/nix.sh ]; then . /home/paul/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# opam configuration
[[ ! -r /home/paul/.opam/opam-init/init.zsh ]] || source /home/paul/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
