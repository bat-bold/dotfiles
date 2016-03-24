fish_vi_mode

if status --is-interactive 
  if test (uname) = "Darwin"
    set PATH /usr/local/opt/coreutils/libexec/gnubin $PATH 
    set MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH
    set MANPATH /usr/local/opt/wget/share/man $MANPATH
    set MANPATH /usr/local/opt/binutils/share/man $MANPATH
    set MANPATH /usr/local/opt/diffutils/share/man $MANPATH
    set MANPATH /usr/local/opt/ed/share/man $MANPATH
    set MANPATH /usr/local/findutils/share/man $MANPATH
    set MANPATH /usr/local/gawk/share/man $MANPATH
    set MANPATH /usr/local/gnu-indent/share/man $MANPATH
    set MANPATH /usr/local/gnu-sed/share/man $MANPATH
    set MANPATH /usr/local/gnu-tar/share/man $MANPATH
    set MANPATH /usr/local/gnu-which/share/man $MANPATH
    set MANPATH /usr/local/gnutls/share/man $MANPATH
    set MANPATH /usr/local/grep/share/man $MANPATH
    set MANPATH /usr/local/gzip/share/man $MANPATH
    set MANPATH /usr/local/screen/share/man $MANPATH
    set MANPATH /usr/local/watch/share/man $MANPATH
    set MANPATH /usr/local/wdiff/share/man $MANPATH
    set MANPATH /usr/local/wget/share/man $MANPATH
  end
end

