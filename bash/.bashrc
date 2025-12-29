# .bashrc

alias backup='borgmatic -c ~/.config/borgmatic.yaml'
alias pdftopng='counter=1; for i in *.pdf; do magick "$i" -background white -alpha remove "$counter.png"; ((counter++)); done'
alias clean-node='find . -name "node_modules" -type d -prune -exec rm -rf {} \;'
alias git-graph='git log --graph --decorate --oneline --all'
alias emacs='emacs -nw'
alias trailing-clean="sed -i 's/[ \t]*$//' *.py"

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
PATH="$PATH:/home/kostya/go/bin:/usr/local/go/bin"
export PATH
if [ -z "$SSH_AUTH_SOCK" ]; then
    export SSH_AUTH_SOCK=$(systemctl --user show ssh-agent.socket --property=Listen | cut -d'=' -f2)
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# if [ -d ~/.bashrc.d ]; then
#     for rc in ~/.bashrc.d/*; do
#         if [ -f "$rc" ]; then
#             . "$rc"
#         fi
#     done
# fi
# unset rc
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
