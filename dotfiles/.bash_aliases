# ln -sfn ~/dot/dotfiles/.bash_aliases ~/.bash_aliases


# =============================== Assorted Utils ===============================
alias simpleserver="python -m SimpleHTTPServer"

# Simple cd and Python virtual env activation for lazy peep
cdd () { cd $1; source venv/bin/activate; }

# Better pidof
piduf () { ps aux | grep $1; }

# Quick grep
krep () { grep -Rin "$@" *; }
krepi () { grep -Rn "$@" *; }

# Quick replace text in files
keplace () { grep -lr --exclude-dir=".git*" -e "$1" . | xargs sed -i "s/$1/$2/g"; }

# God's browser
godbrowser () { watch -d -n $1 curl -sv http://127.0.0.1:$2/; }

fnd() {
  find . -name $1
}

fit() {
  find . -name "$2" | xargs git $1 --
}

getpid() {
  ps aux | grep icewm | grep -v grep
}

tf() {
  tree -P "$@"
}

_scd_completion() {
    mapfile -t COMPREPLY < <(ls -d */ | grep "${COMP_WORDS[COMP_CWORD]}")
}
complete -F _scd_completion scd


# ================================= Shortcuts ==================================
alias l.='ls -d .* --color=auto'
alias ..='cd ..'
alias .2='cd ../../'
alias .3='cd ../../../'
alias h='history'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lsd='ls -al | grep ^d'
alias lsn="ls -al | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}'"
alias gitlines="git ls-files | xargs wc -l"


# ================================== Editors ===================================
alias restartemacs="emacsclient -e '(save-buffers-kill-emacs)' && emacs --daemon"
alias ge="geany"
alias em="emacsclient -c -nw"
