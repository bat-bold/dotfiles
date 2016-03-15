function fish_user_key_bindings

  # The default escape timeout is 300ms. But for users of Vi bindings that can
  # be slightly annoying when trying to switch to Vi "normal" mode. Too,
  # vi-mode users are unlikely to use escape-as-meta. So set a much shorter
  # timeout in this case.
  set -q fish_escape_delay_ms; or set -g fish_escape_delay_ms 10

  set -l init_mode insert
  set -l eol_keys \$ d\$ \e\[F # 'd' was 'g'
  set -l bol_keys \^ 0 d\^ \e\[H # 'd' was 'g'
  if set -q argv[1]
    set init_mode $argv[1]
  end

  # Inherit default key bindings.
  # Do this first so vi-bindings win over default.
  bind --erase --all
  fish_default_key_bindings -M insert
  fish_default_key_bindings -M default

  # Add a way to switch from insert to normal (command) mode.
  bind -M insert -m default \cc force-repaint
  bind -M insert -m default \e backward-char force-repaint

  #
  # normal (command) mode
  #
  bind :q exit
  bind \cs exit # 's' was 'd'
  bind \cc 'commandline ""'
  bind h backward-char 
  bind i forward-char # 'i' was 'l'
  bind \e\[C forward-char
  bind \e\[D backward-char

  # Some linux VTs output these (why?)
  bind \eOC forward-char
  bind \eOD backward-char

  bind -k right forward-char
  bind -k left backward-char
  bind -m insert \n execute
  bind -m insert \r execute
  bind -m insert u force-repaint # 'u' was 'i'
  bind -m insert U beginning-of-line force-repaint # 'U' was 'I'
  bind -m insert a forward-char force-repaint
  bind -m insert A end-of-line force-repaint
  bind -m visual v begin-selection force-repaint

  #bind -m insert o "commandline -a \n" down-line force-repaint
  #bind -m insert O beginning-of-line "commandline -i \n" up-line force-repaint # doesn't work

  bind dd beginning-of-buffer # 'dd' was 'gg'
  bind D end-of-buffer # 'D' was 'G'

  for key in $eol_keys
      bind $key end-of-line
  end
  for key in $bol_keys
      bind $key beginning-of-line
  end

  bind l history-search-backward # 'l' was 'u'
  bind \cp history-search-forward # 'p' was 'r'

  bind [ history-token-search-backward
  bind ] history-token-search-forward

  bind e up-or-search # 'e' was 'k'
  bind n down-or-search # 'n' was 'j'
  bind \e\[A up-or-search
  bind \e\[B down-or-search
  bind -k down down-or-search
  bind -k up up-or-search
  bind \eOA up-or-search
  bind \eOB down-or-search

  bind b backward-word
  bind B backward-bigword
  bind df backward-word # 'df' was 'ge'
  bind dF backward-bigword # 'dF' was 'gE'
  bind w forward-word
  bind W forward-bigword
  bind f forward-word # 'f' was 'e'
  bind F forward-bigword # 'F' was 'E'

  bind x delete-char
  bind X backward-delete-char

  bind -k dc delete-char

  bind -k backspace backward-delete-char
  bind \x7f backward-delete-char
  bind \e\[3\;2~ backward-delete-char # Mavericks Terminal.app shift-delete

  bind ss kill-whole-line # 'ss' was 'dd'
  bind S kill-line # 'S' was 'D'
  bind s\$ kill-line # 's' was 'd'
  bind s\^ backward-kill-line #'s' was 'd'
  bind sw kill-word # 'sw' was 'dw'
  bind sW kill-bigword 'sW' was 'dW'
  bind suw forward-char forward-char backward-word kill-word # 'suw' was 'diw'
  bind suW forward-char forward-char backward-bigword kill-bigword # 'suW' was 'diW'
  bind saw forward-char forward-char backward-word kill-word # 'saw' was 'daw'
  bind saW forward-char forward-char backward-bigword kill-bigword # 'saW' was 'daW'
  bind sf kill-word # 'sf' was 'de'
  bind sF kill-bigword # 'sF' was 'dE'
  bind sb backward-kill-word # 'sb' was 'db'
  bind sB backward-kill-bigword # 'sB' was 'dB'
  bind sdf backward-kill-word # 'sdf' was 'dge'
  bind sdF backward-kill-bigword 'sdF' was 'dgE'

  bind -m insert r delete-char force-repaint # 'r' was 's'
  bind -m insert R kill-whole-line force-repaint # 'R' was 'S'
  bind -m insert cc kill-whole-line force-repaint
  bind -m insert C kill-line force-repaint
  bind -m insert c\$ kill-line force-repaint
  bind -m insert c\^ backward-kill-line force-repaint
  bind -m insert cw kill-word force-repaint
  bind -m insert cW kill-bigword force-repaint
  bind -m insert cuw forward-char forward-char backward-word kill-word force-repaint # 'cuw' was 'ciw'
  bind -m insert cuW forward-char forward-char backward-bigword kill-bigword force-repaint # 'cuW' was 'ciW'
  bind -m insert caw forward-char forward-char backward-word kill-word force-repaint
  bind -m insert caW forward-char forward-char backward-bigword kill-bigword force-repaint
  bind -m insert cf kill-word force-repaint # 'cf' was 'ce'
  bind -m insert cF kill-bigword force-repaint # 'cF' was 'cE'
  bind -m insert cb backward-kill-word force-repaint
  bind -m insert cB backward-kill-bigword force-repaint
  bind -m insert cdf backward-kill-word force-repaint # 'cdf' was 'cge'
  bind -m insert cdF backward-kill-bigword force-repaint # 'cdF' was 'cgE'

  bind '~' capitalize-word
  bind dl downcase-word # 'dl' was 'gu' 
  bind dL upcase-word # 'dL' was 'gU'

  bind N end-of-line delete-char # 'N' was 'J'
  bind E 'man (commandline -t) ^/dev/null; or echo -n \a' # 'E' was 'K'

  bind jj kill-whole-line yank # 'jj' was 'yy'
  bind J kill-whole-line yank # 'J' was 'Y'
  bind j\$ kill-line yank # 'j' was 'y'
  bind j\^ backward-kill-line yank # 'j' was 'y'
  bind jw kill-word yank # 'jw' was 'yw'
  bind jW kill-bigword yank # 'jW' was 'yW'
  bind juw forward-char forward-char backward-word kill-word yank # 'juw' was 'yiw'
  bind juW forward-char forward-char backward-bigword kill-bigword yank # 'juW' was 'yiW'
  bind jaw forward-char forward-char backward-word kill-word yank # 'jaw' was 'yaw'
  bind jaW forward-char forward-char backward-bigword kill-bigword yank # 'jaW' was 'yaW'
  bind jf kill-word yank # 'jf' was 'ye'
  bind jF kill-bigword yank # 'jF' was 'yE'
  bind jb backward-kill-word yank # 'jb' was 'yb'
  bind jB backward-kill-bigword yank # 'jB' was 'yB'
  bind jdf backward-kill-word yank # 'jdf' was 'yge'
  bind jdF backward-kill-bigword yank # 'jdF' was 'ygE'

  bind t forward-jump # 't' was 'f'
  bind T backward-jump # 'T' was 'f'
  bind g forward-jump and backward-char # 'g' was 't'
  bind G backward-jump and forward-char # 'G' was 'T'

  # in emacs yank means paste
  bind o yank # 'o' was 'p'
  bind O backward-char yank # 'O' was 'P'
  bind do yank-pop # 'do' was  'gp'

  ### Overrides
  # This is complete in vim
  bind -M insert \cx end-of-line

  bind '"*p' "commandline -i ( xsel -p; echo )[1]"
  bind '"*P' backward-char "commandline -i ( xsel -p; echo )[1]"

  #
  # Lowercase r, enters replace-one mode
  #
  bind -m replace-one p force-repaint # 'p' was 'r'
  bind -M replace-one -m default '' delete-char self-insert backward-char force-repaint
  bind -M replace-one -m default \e cancel force-repaint

	# d = s
	#bind --erase d
	#bind ss kill-whole-line
	#bind S kill-line
	#bind sw kill-word
	#bind sW kill-bidword
	#bind suw forward-char forward-char backward-word kill-word
	#bind suW forward-char forward-char backward-bigword kill-bigword
	#bind saw forward-char forward-char backward-word kill-word
	#bind saW forward-char forward-char backward-bigword kill-bigword
	#bind sf kill-word
	#bind sF kill-bigword
	#bind sb backward-kill-word
	#bind sB backward-kill-bigword
	#bind sdf backward-kill-word
	#bind sdF backward-kill-bigword

	# c = c
	#bind --erase c
	#bind -m insert cc kill-whole-line force-repaint
	#bind -m insert C kill-line force-repaint
	#bind -m insert c\x24 kill-line force-repaint
	#bind -m insert c\x5e backward-kill-line force-repaint
	#bind -m insert cw kill-word force-repaint
	#bind -m insert cW kill-bigword force-repaint
	#bind -m insert cuw forward-char forward-char backward-word kill-word force-repaint
	#bind -m insert cuW forward-char forward-char backward-bigword kill-bigword force-repaint
	#bind -m insert caw forward-char forward-char backward-word kill-word force-repaint
	#bind -m insert caW forward-char forward-char backward-bigword kill-bigword force-repaint
	#bind -m insert cf kill-word force-repaint
	#bind -m insert cF kill-bigword force-repaint
	#bind -m insert cb backward-kill-word force-repaint
	#bind -m insert cB backward-kill-bigword force-repaint
	#bind -m insert cdf backward-kill-word force-repaint
	#bind -m insert cdF backward-kill-bigword force-repaint

	# y = j
	#bind --erase y
	#bind jj kill-whole-line yank
	#bind J  kill-whole-line yank
	#bind j\x24 kill-line yank
	#bind j\x5e backward-kill-line yank
	#bind jw kill-word yank
	#bind jW kill-bigword yank
	#bind juw forward-char forward-char backward-word kill-word yank
	#bind juW forward-char forward-char backward-bigword kill-bigword yank
	#bind jaw forward-char forward-char backward-word kill-word yank
	#bind jaW forward-char forward-char backward-bigword kill-bigword yank
	#bind jf kill-word yank
	#bind jF kill-bigword yank
	#bind jb backward-kill-word yank
	#bind jB backward-kill-bigword yank
	#bind jdf backward-kill-word yank
	#bind jdF backward-kill-bigword yank

	# i = u
	#bind --erase i
	#bind -m insert u force-repaint
	#bind -m insert U beginning-of-line force-repaint

	#bind i forward-char
	#bind f forward-word
	#bind F forward-bigword

	#bind --erase t
	#bind t forward-jump
	#bind T backward-jump

	#bind --erase g
	#bind g forward-jump
	#bind G backward-jump

	#bind --erase \x1b\x5b\x43
	#bind --erase \x1b\x5b\x44
	#bind -M insert \c\x43 forward-word  force-repaint
	#bind -M insert \c\x44 backward-word force-repaint

  # visual mode

    #default bindings no need to overwrite.
  #bind -M visual \e\[C forward-char
  #bind -M visual \e\[D backward-char
  #bind -M visual -k right forward-char
  #bind -M visual -k left backward-char
  #bind -M insert \eOC forward-char
  #bind -M insert \eOD backward-char

  bind -M visual h backward-char
  bind -M visual i forward-char # it was 'l'

  bind -M visual e up-line # it was k
  bind -M visual n down-line # it was j

  #bind -M visual b backward-word
  #bind -M visual B backward-bigword

  bind -M visual df backward-word #it was 'ge'
  bind -M visual dF backward-bigword #it was 'gE'
  bind -M visual w forward-word
  bind -M visual W forward-bigword
  bind -M visual f forward-word #it was 'e'
  bind -M visual F forward-bigword #it was 'E'

  for key in $eol_keys
      bind -M visual $key end-of-line
  end
  for key in $bol_keys
      bind -M visual $key beginning-of-line
  end

  bind -M visual -m insert  c kill-selection end-selection force-repaint
  bind -M visual -m default s kill-selection end-selection force-repaint # 's' was 'd'
  bind -M visual -m default x kill-selection end-selection force-repaint
  bind -M visual -m default X kill-whole-line end-selection force-repaint
  bind -M visual -m default j kill-selection yank end-selection force-repaint # 'j' was 'y'
  bind -M visual -m default '"*j' "commandline -s | xsel -p" end-selection force-repaint # 'j' was 'y'

  bind -M visual -m default \cc end-selection force-repaint
  bind -M visual -m default \e  end-selection force-repaint

end
