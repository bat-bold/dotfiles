fish_vi_mode

if status --is-interactive
  set PATH $PATH /usr/local/opt/coreutils/libexec/gnubin
  set MANPATH $MANPATH /usr/local/opt/coreutils/libexec/gnuman
end
