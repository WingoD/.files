alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias ls='ls --time-style="+%F %T.%3N"'

alias dfl='df -hlP | egrep "^(/dev|Filesystem)"'
alias utcdate="TZ=UTC date +%FT%T"
alias resource='. $HOME/.bashrc'
alias h='history | tail -100'

alias sus='sort | uniq -c | sort -n'
alias uncolor='sed -r "s/\x1B\[([0-9]{1,3}((;[0-9]{1,3})*)?)?[m|K]//g"'
alias update_ansible_hosts='br list | awk "{print \$2}" | grep ec2- > ~/ansible_hosts'

alias svndiff="svn diff --diff-cmd ${HOME}/bin/svndiffwrap.sh"
alias nsvn='grep -v svn'

alias vrw='. ~/ibin/vrw'
alias vro='. ~/ibin/vro'

alias jql='jq -S -C . | less -r'

alias d='dirs -p'
pushd() { builtin pushd "$@" > >( sed -e "s/ /\n/g" ); }

vt(){
  if [[ $TMUX ]]; then tmux rename-window Today; fi
  sleep 3
  touch ~/Today/$(date +%F)
  vim ~/Today/$(date +%F) ~/Files/Todo ~/Files/Todos
}
