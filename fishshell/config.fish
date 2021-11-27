
fish_vi_key_bindings insert

set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

if status --is-interactive 
  if test (uname) = "Darwin" # only on when running in mac osx
    # PATH config for Postgres.app from https://postgresapp.com
    set PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH
    # coreutils manpath config
    set PATH /usr/local/opt/coreutils/libexec/gnubin $PATH 
    set PATH /usr/local/bin $PATH 
    set PATH /usr/local/sbin $PATH 
    set MANPATH /usr/local/opt/*/share/man $MANPATH
    set MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH

    #Android SDK
    if test -d $HOME/Library/Android/sdk
      set -Ux ANDROID_SDK $HOME/Library/Android/sdk
      set PATH $ANDROID_SDK/tools $PATH
      set PATH $ANDROID_SDK/tools/bin $PATH
      set PATH $ANDROID_SDK/emulator $PATH
    end

    #make gnu utils available
    if test -d /usr/local/opt/ed/libexec/gnubin
      set PATH /usr/local/opt/ed/libexec/gnubin $PATH
    end
    if test -d /usr/local/opt/findutils/libexec/gnubin
      set PATH /usr/local/opt/findutils/libexec/gnubin $PATH
    end
    if test -d /usr/local/opt/gnu-indent/libexec/gnubin
      set PATH /usr/local/opt/gnu-indent/libexec/gnubin $PATH
    end
    if test -d /usr/local/opt/gnu-sed/libexec/gnubin
      set PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
    end
    if test -d /usr/local/opt/gnu-tar/libexec/gnubin
      set PATH /usr/local/opt/gnu-tar/libexec/gnubin $PATH
    end
    if test -d /usr/local/opt/gnu-which/libexec/gnubin
      set PATH /usr/local/opt/gnu-which/libexec/gnubin $PATH
    end
    if test -d /usr/local/opt/grep/libexec/gnubin
      set PATH /usr/local/opt/grep/libexec/gnubin $PATH
    end

    if test -d /usr/local/opt/node@16/bin
      set PATH /usr/local/opt/node@16/bin $PATH
    end

  end
end
