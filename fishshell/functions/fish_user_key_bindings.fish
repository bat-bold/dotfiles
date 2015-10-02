function fish_user_key_bindings

	# d = s
	bind --erase d
	bind ss kill-whole-line
	bind S kill-line
	bind sw kill-word
	bind sW kill-bidword
	bind suw forward-char forward-char backward-word kill-word
	bind suW forward-char forward-char backward-bigword kill-bigword
	bind saw forward-char forward-char backward-word kill-word
	bind saW forward-char forward-char backward-bigword kill-bigword
	bind sf kill-word
	bind sF kill-bigword
	bind sb backward-kill-word
	bind sB backward-kill-bigword
	bind sdf backward-kill-word
	bind sdF backward-kill-bigword

	# c = c
	bind --erase c
	bind -m insert cc kill-whole-line force-repaint
	bind -m insert C kill-line force-repaint
	bind -m insert c\x24 kill-line force-repaint
	bind -m insert c\x5e backward-kill-line force-repaint
	bind -m insert cw kill-word force-repaint
	bind -m insert cW kill-bigword force-repaint
	bind -m insert cuw forward-char forward-char backward-word kill-word force-repaint
	bind -m insert cuW forward-char forward-char backward-bigword kill-bigword force-repaint
	bind -m insert caw forward-char forward-char backward-word kill-word force-repaint
	bind -m insert caW forward-char forward-char backward-bigword kill-bigword force-repaint
	bind -m insert cf kill-word force-repaint
	bind -m insert cF kill-bigword force-repaint
	bind -m insert cb backward-kill-word force-repaint
	bind -m insert cB backward-kill-bigword force-repaint
	bind -m insert cdf backward-kill-word force-repaint
	bind -m insert cdF backward-kill-bigword force-repaint

	# y = j
	bind --erase y
	bind jj kill-whole-line yank
	bind J  kill-whole-line yank
	bind j\x24 kill-line yank
	bind j\x5e backward-kill-line yank
	bind jw kill-word yank
	bind jW kill-bigword yank
	bind juw forward-char forward-char backward-word kill-word yank
	bind juW forward-char forward-char backward-bigword kill-bigword yank
	bind jaw forward-char forward-char backward-word kill-word yank
	bind jaW forward-char forward-char backward-bigword kill-bigword yank
	bind jf kill-word yank
	bind jF kill-bigword yank
	bind jb backward-kill-word yank
	bind jB backward-kill-bigword yank
	bind jdf backward-kill-word yank
	bind jdF backward-kill-bigword yank

	# i = u
	bind --erase i
	bind -m insert u force-repaint
	bind -m insert U beginning-of-line force-repaint

	bind i forward-char
	bind f forward-word
	bind F forward-bigword

	bind --erase t
	bind t forward-jump
	bind T backward-jump

	bind --erase g
	bind g forward-jump
	bind G backward-jump

	#bind --erase \x1b\x5b\x43
	#bind --erase \x1b\x5b\x44
	#bind -M insert \c\x43 forward-word  force-repaint
	#bind -M insert \c\x44 backward-word force-repaint

end
