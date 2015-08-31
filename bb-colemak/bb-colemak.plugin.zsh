# ctrl-j newline
bindkey ^n accept-line
bindkey -a ^n accept-line

# another rotation to match qwerty
bindkey -a n down-line-or-history
bindkey -a e up-line-or-history
bindkey -a i vi-forward-char

# make qwerty
bindkey -a k vi-repeat-search
bindkey -a K vi-rev-repeat-search
bindkey -a u vi-insert
bindkey -a U vi-insert-bol
bindkey -a l vi-undo-change
bindkey -a N vi-join
bindkey -a s vi-delete
bindkey -a p vi-replace-chars

# spare
bindkey -a f vi-forward-word-end
bindkey -a F vi-forward-blank-word-end
bindkey -a t vi-find-next-char
bindkey -a T vi-find-prev-char
bindkey -a g vi-find-next-char-skip
bindkey -a G vi-find-prev-char-skip

lesskey $ZSH/custom/plugins/bb-colemak/colemak-less
