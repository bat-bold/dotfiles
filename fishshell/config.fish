fish_vi_mode

if status --is-interactive 
  if test (uname) = "Darwin"
    set PATH /usr/local/opt/coreutils/libexec/gnubin $PATH 
    set MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH
  end
end

