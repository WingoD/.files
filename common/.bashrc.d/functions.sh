optionally_pathmunge () {
  for i in "$@"
  do
    if [[ -d $i ]]
    then
      pathmunge $i
      return
    fi
  done
}

pathmunge () {
  case ":${PATH}:" in
    *:"$1":*)
    ;;
    *)
    if [ "$2" = "after" ] ; then
      PATH=$PATH:$1
    else
      PATH=$1:$PATH
    fi
  esac
}

pathremove () {
  # Remove it at the end of PATH
  PATH=${PATH%:$1}
  # Remove it at the start of PATH
  PATH=${PATH#$1:}
  # Remove it from the middle of the PATH
  PATH=${PATH/:$1:/:}
  # BUG - what if it were there in the middle more than once?
}

path_jruby () {
  pathremove /opt/depot/ruby-1.8.7-p248/bin
  pathremove /opt/unused/ruby-1.8.7-p72/bin
  pathmunge  /opt/jruby/bin
  which ruby
}


path_ruby () {
  pathremove /opt/jruby/bin
  pathmunge  /opt/depot/ruby-1.8.7-p248/bin
  which ruby
}

optionally_source () {
  if [[ -f $1 ]]
  then
    . $1
  fi
}

function iso8601 () {
  date +%Y-%m-%dT%H:%M:%S
}

function ctd() {
  a_tmp=`ls -d -1 ~/tmp/$1-20* | tail -1`
  cd "$a_tmp"
}

function mtd() {
  a_tmp=~/tmp/$1-$(iso8601)
  mkdir "$a_tmp"
  cd "$a_tmp"
}
