fish_vi_mode

if status --is-interactive 
  if test (uname) = "Darwin"
    set PATH /usr/local/opt/coreutils/libexec/gnubin $PATH 
    set MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH
    set MANPATH /usr/local/opt/wget/share/man $MANPATH
    set MANPATH /usr/local/opt/binutils/share/man $MANPATH
    set MANPATH /usr/local/opt/diffutils/share/man $MANPATH
    set MANPATH /usr/local/opt/ed/share/man $MANPATH
    set MANPATH /usr/local/opt/findutils/share/man $MANPATH
    set MANPATH /usr/local/opt/gawk/share/man $MANPATH
    set MANPATH /usr/local/opt/gnu-indent/share/man $MANPATH
    set MANPATH /usr/local/opt/gnu-sed/share/man $MANPATH
    set MANPATH /usr/local/opt/gnu-tar/share/man $MANPATH
    set MANPATH /usr/local/opt/gnu-which/share/man $MANPATH
    set MANPATH /usr/local/opt/gnutls/share/man $MANPATH
    set MANPATH /usr/local/opt/grep/share/man $MANPATH
    set MANPATH /usr/local/opt/gzip/share/man $MANPATH
    set MANPATH /usr/local/opt/screen/share/man $MANPATH
    set MANPATH /usr/local/opt/watch/share/man $MANPATH
    set MANPATH /usr/local/opt/wdiff/share/man $MANPATH
    set MANPATH /usr/local/opt/wget/share/man $MANPATH
  end
end

