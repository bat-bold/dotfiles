fish_vi_key_bindings

set -g -x SBT_OPTS "-Xmx2G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xss2M"

if status --is-interactive 
  if test (uname) = "Darwin" # only on when running in mac osx
    # PATH config for Postgres.app from https://postgresapp.com
    set PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH
    # coreutils manpath config
    set PATH /usr/local/opt/coreutils/libexec/gnubin $PATH 
    set MANPATH /usr/local/opt/*/share/man $MANPATH
    set MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH
  end
end
