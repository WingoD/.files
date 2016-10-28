alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias ls='ls --time-style="+%F %T.%3N"'
alias guts="grep . | egrep -v '^[[:space:]]*#'"

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

alias psr="ps -ef | sed -e 's#java -Xmx.*m -Xss2048k -Djffi.boot.library.path=/opt/jruby/lib/native/i386-Linux:/opt/jruby/lib/native/ppc-Linux:/opt/jruby/lib/native/x86_64-Linux -Xbootclasspath/a:/opt/jruby/lib/jruby.jar -classpath :/opt/jruby/lib -Djruby.home=/opt/jruby -Djruby.lib=/opt/jruby/lib -Djruby.script=jruby -Djruby.shell=/bin/sh org.jruby.Main #jruby #' -e 's#/opt/depot/ruby-1.8.7-p248/lib/ruby/gems/1.8/gems/passenger-2.2.8/ext/apache2/ApplicationPoolServerExecutable 0 /opt/depot/ruby-1.8.7-p248/lib/ruby/gems/1.8/gems/passenger-2.2.8/bin/passenger-spawn-server#passenger-spawn-server #' | grep ruby"

alias d='dirs -p'
pushd() { builtin pushd "$@" > >( sed -e "s/ /\n/g" ); }

hl(){
  egrep "$@" /etc/hosts | grep -v ^#
}

grh(){
  local host
  host=$1
  shift
  ssh $host grep "$@" .bash_history
}

vt(){
  if [[ $TMUX ]]; then tmux rename-window Today; fi
  sleep 3
  touch ~/Today/$(date +%F)
  vim ~/Today/$(date +%F) ~/Files/Todo ~/Files/Todos
}
