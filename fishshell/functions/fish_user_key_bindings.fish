function fish_user_key_bindings

    bind -s --user -M insert \e\x7F backward-kill-word force-repaint
    bind -s --user -M insert \ef forward-word force-repaint

    # The default escape timeout is 300ms. But for users of Vi bindings that can be slightly
    # annoying when trying to switch to Vi "normal" mode. So set a shorter timeout in this case
    # unless the user has explicitly set the delay.
    set -q fish_escape_delay_ms
    or set -g fish_escape_delay_ms 100

    set -l init_mode insert
    # These are only the special vi-style keys
    # not end/home, we share those.
    set -l eol_keys \$ d\$ # 'd' was 'g'
    set -l bol_keys \^ 0 d\^ # 'd' was 'g'

    if contains -- $argv[1] insert default visual
        set init_mode $argv[1]
    else if set -q argv[1]
        # We should still go on so the bindings still get set.
        echo "Unknown argument $argv" >&2
    end

    # Inherit shared key bindings.
    # Do this first so vi-bindings win over default.
    for mode in insert default visual
        __fish_shared_key_bindings -M $mode
    end

    bind -s --preset -M insert \r execute
    bind -s --preset -M insert \n execute

    bind -s --preset -M insert "" self-insert

    # Add way to kill current command line while in insert mode.
    bind -s --preset -M insert \cc __fish_cancel_commandline
    # Add a way to switch from insert to normal (command) mode.
    # Note if we are paging, we want to stay in insert mode
    # See #2871
    bind -s --preset -M insert \e "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"

    # Default (command) mode
    bind -s --preset :q exit
    bind -s --preset -m insert \cc __fish_cancel_commandline
    bind -s --preset -M default h backward-char 
    bind -s --preset -M default i forward-char # 'i' was 'l'
    bind -s --preset -m insert \n execute
    bind -s --preset -m insert \r execute
    bind -s --preset -m insert u force-repaint # 'u' was 'i'
    bind -s --preset -m insert U beginning-of-line force-repaint # 'U' was 'I'
    bind -s --preset -m insert a forward-char force-repaint
    bind -s --preset -m insert A end-of-line force-repaint
    bind -s --preset -m visual v begin-selection force-repaint

    #bind -s --preset -m insert o "commandline -a \n" down-line force-repaint
    #bind -s --preset -m insert O beginning-of-line "commandline -i \n" up-line force-repaint # doesn't work

    bind -s --preset dd beginning-of-buffer # 'dd' was 'gg'
    bind -s --preset D end-of-buffer # 'D' was 'G'

    for key in $eol_keys
        bind -s --preset $key end-of-line
    end
    for key in $bol_keys
        bind -s --preset $key beginning-of-line
    end

    bind -s --preset l history-search-backward # 'l' was 'u'
    bind -s --preset L history-search-forward # 'p' was 'r'

    bind -s --preset [ history-token-search-backward
    bind -s --preset ] history-token-search-forward

    bind -s --preset e up-or-search # 'e' was 'k'
    bind -s --preset n down-or-search # 'n' was 'j'
    bind -s --preset b backward-word
    bind -s --preset B backward-bigword
    bind -s --preset df backward-word # 'df' was 'ge'
    bind -s --preset dF backward-bigword # 'dF' was 'gE'
    bind -s --preset w forward-word forward-char
    bind -s --preset W forward-bigword forward-char
    bind -s --preset f forward-char forward-word backward-char # 'f' was 'e'
    bind -s --preset F forward-bigword backward-char # 'F' was 'E'

    # OS X SnowLeopard doesn't have these keys. Don't show an annoying error message.
    # Vi/Vim doesn't support these keys in insert mode but that seems silly so we do so anyway.
    bind -s --preset -M insert -k home beginning-of-line 2>/dev/null
    bind -s --preset -M default -k home beginning-of-line 2>/dev/null
    bind -s --preset -M insert -k end end-of-line 2>/dev/null
    bind -s --preset -M default -k end end-of-line 2>/dev/null

    # Vi moves the cursor back if, after deleting, it is at EOL.
    # To emulate that, move forward, then backward, which will be a NOP
    # if there is something to move forward to.
    bind -s --preset -M default x delete-char forward-char backward-char
    bind -s --preset -M default X backward-delete-char
    bind -s --preset -M insert -k sc delete-char forward-char backward-char # 'sc' was 'dc'
    bind -s --preset -M default -k sc delete-char forward-char backward-char # 'sc' was 'dc'

    # Backspace deletes a char in insert mode, but not in normal/default mode.
    bind -s --preset -M insert -k backspace backward-delete-char
    bind -s --preset -M default -k backspace backward-char
    bind -s --preset -M insert \ch backward-delete-char
    bind -s --preset -M default \ch backward-char
    bind -s --preset -M insert \x7f backward-delete-char
    bind -s --preset -M default \x7f backward-char
    bind -s --preset -M insert \e\[3\;2~ backward-delete-char # Mavericks Terminal.app shift-ctrl-delete
    bind -s --preset -M default \e\[3\;2~ backward-delete-char # Mavericks Terminal.app shift-ctrl-delete

    bind -s --preset ss kill-whole-line # 'ss' was 'dd'
    bind -s --preset S kill-line # 'S' was 'D'
    bind -s --preset s\$ kill-line # 's' was 'd'
    bind -s --preset d\^ backward-kill-line # 's' was 'd'
    bind -s --preset sw kill-word # 'sw' was 'dw'
    bind -s --preset sW kill-bigword # 'sW' was 'dW'
    bind -s --preset suw forward-char forward-char backward-word kill-word # 'suw' was 'diw'
    bind -s --preset suW forward-char forward-char backward-bigword kill-bigword # 'suW' was 'diW'
    bind -s --preset saw forward-char forward-char backward-word kill-word # 'saw' was 'daw'
    bind -s --preset saW forward-char forward-char backward-bigword kill-bigword # 'saW' was 'daW'
    bind -s --preset sf kill-word # 'sf' was 'de'
    bind -s --preset sF kill-bigword # 'sF' was 'dE'
    bind -s --preset sb backward-kill-word # 'sb' was 'db'
    bind -s --preset sB backward-kill-bigword # 'sB' was 'dB'
    bind -s --preset sdf backward-kill-word # 'sdf' was 'dge'
    bind -s --preset sdF backward-kill-bigword # 'sdF' was 'dgE'
    bind -s --preset st begin-selection forward-jump kill-selection delete-char end-selection # 'st' was 'df'
    bind -s --preset sg begin-selection forward-jump kill-selection end-selection # 'sg' was 'dt'
    bind -s --preset sT begin-selection backward-jump kill-selection end-selection # 'sT' was 'dF'
    bind -s --preset sG begin-selection backward-jump forward-char kill-selection end-selection # 'sG' was 'dT'

    bind -s --preset -m insert r delete-char force-repaint # 'r' was 's'
    bind -s --preset -m insert R kill-whole-line force-repaint # 'R' was 'S'
    bind -s --preset -m insert cc kill-whole-line force-repaint
    bind -s --preset -m insert C kill-line force-repaint
    bind -s --preset -m insert c\$ kill-line force-repaint
    bind -s --preset -m insert c\^ backward-kill-line force-repaint
    bind -s --preset -m insert cw kill-word force-repaint
    bind -s --preset -m insert cW kill-bigword force-repaint
    bind -s --preset -m insert cuw forward-char forward-char backward-word kill-word force-repaint # 'cuw' was 'ciw'
    bind -s --preset -m insert cuW forward-char forward-char backward-bigword kill-bigword force-repaint # 'cuW' was 'ciW'
    bind -s --preset -m insert caw forward-char forward-char backward-word kill-word force-repaint 
    bind -s --preset -m insert caW forward-char forward-char backward-bigword kill-bigword force-repaint
    bind -s --preset -m insert cf kill-word force-repaint # 'cf' was 'ce'
    bind -s --preset -m insert cF kill-bigword force-repaint # 'cF' was 'cE'
    bind -s --preset -m insert cb backward-kill-word force-repaint
    bind -s --preset -m insert cB backward-kill-bigword force-repaint
    bind -s --preset -m insert cdf backward-kill-word force-repaint # 'cdf' was 'cge'
    bind -s --preset -m insert cdF backward-kill-bigword force-repaint # 'cdF' was ' cdE

    bind -s --preset -m insert ct begin-selection forward-jump kill-selection delete-char end-selection force-repaint # 'ct' was 'cf'
    bind -s --preset -m insert cg begin-selection forward-jump kill-selection end-selection force-repaint # 'cg' was 'ct'

    bind -s --preset '~' capitalize-word
    bind -s --preset dl downcase-word # 'dl' was 'gu'
    bind -s --preset dL upcase-word # 'dL' was 'gU'

    bind -s --preset N end-of-line delete-char # 'N' was 'j'
    bind -s --preset K 'man (commandline -t) 2>/dev/null; or echo -n \a'

    bind -s --preset jj kill-whole-line yank # 'jj' was 'yy'
    bind -s --preset J kill-whole-line yank # 'J' was 'Y'
    bind -s --preset j\$ kill-line yank # 'j' was 'y'
    bind -s --preset j\^ backward-kill-line yank # 'j' was 'y'
    bind -s --preset jw kill-word yank # 'jw' was 'yw'
    bind -s --preset jW kill-bigword yank # 'jW' was 'yW'
    bind -s --preset juw forward-char forward-char backward-word kill-word yank # 'juw' was 'yiw'
    bind -s --preset juW forward-char forward-char backward-bigword kill-bigword yank # 'juW' was 'yiW'
    bind -s --preset jaw forward-char forward-char backward-word kill-word yank # 'jaw' was 'yaw'
    bind -s --preset jaW forward-char forward-char backward-bigword kill-bigword yank # 'jaW' was 'yaW'
    bind -s --preset jf kill-word yank # 'jf' was 'ye'
    bind -s --preset yE kill-bigword yank # 'jF' was 'yE'
    bind -s --preset yb backward-kill-word yank # 'jb' was 'yb'
    bind -s --preset yB backward-kill-bigword yank # 'jB' was 'yB'
    bind -s --preset jdf backward-kill-word yank # 'jdf' was 'yge'
    bind -s --preset jdF backward-kill-bigword yank # 'jdF' was 'ygE'

    bind -s --preset t forward-jump # 't' was 'f'
    bind -s --preset T backward-jump # 'T' was 'F'
    bind -s --preset g forward-jump-till # 'g' was 't'
    bind -s --preset G backward-jump-till # 'G' was 'T'
    bind -s --preset ';' repeat-jump
    bind -s --preset , repeat-jump-reverse

    # in emacs yank means paste
    bind -s --preset \' yank # '\'' was 'p'
    bind -s --preset \" backward-char yank # '\"' was 'P'
    bind -s --preset d\" yank-pop # 'd"' was 'gp'

    bind -s --preset '"*p' "commandline -i ( xsel -p; echo )[1]"
    bind -s --preset '"*P' backward-char "commandline -i ( xsel -p; echo )[1]"

    #
    # Lowercase r, enters replace_one mode
    #
    bind -s --preset -m replace_one p force-repaint # 'p' was 'r'
    bind -s --preset -M replace_one -m default '' delete-char self-insert backward-char force-repaint
    bind -s --preset -M replace_one -m default \e cancel force-repaint

    #
    # visual mode
    #
    bind -s --preset -M visual h backward-char
    bind -s --preset -M visual i forward-char # 'i' was 'l'

    bind -s --preset -M visual e up-line # 'e' was 'k'
    bind -s --preset -M visual n down-line # 'n' was 'j'

    bind -s --preset -M visual b backward-word
    bind -s --preset -M visual B backward-bigword
    bind -s --preset -M visual df backward-word # 'df' was 'ge'
    bind -s --preset -M visual dF backward-bigword # 'dF' was 'gE'
    bind -s --preset -M visual w forward-word
    bind -s --preset -M visual W forward-bigword
    bind -s --preset -M visual f forward-word # 'f' was 'e'
    bind -s --preset -M visual F forward-bigword # 'F' was 'E'
    bind -s --preset -M visual y swap-selection-start-stop force-repaint # 'y' was 'o'

    bind -s --preset -M visual t forward-jump # 't' was 'f'
    bind -s --preset -M visual g forward-jump-till # 'g' was 't'
    bind -s --preset -M visual T backward-jump # 'T' was 'F'
    bind -s --preset -M visual G backward-jump-till # 'G' was 'T'

    for key in $eol_keys
        bind -s --preset -M visual $key end-of-line
    end
    for key in $bol_keys
        bind -s --preset -M visual $key beginning-of-line
    end

    bind -s --preset -M visual -m insert c kill-selection end-selection force-repaint
    bind -s --preset -M visual -m default s kill-selection end-selection force-repaint # 's' was 'd'
    bind -s --preset -M visual -m default x kill-selection end-selection force-repaint 
    bind -s --preset -M visual -m default X kill-whole-line end-selection force-repaint
    bind -s --preset -M visual -m default y kill-selection yank end-selection force-repaint
    bind -s --preset -M visual -m default '"*y' "commandline -s | xsel -p; commandline -f end-selection force-repaint"

    bind -s --preset -M visual -m default \cc end-selection force-repaint
    bind -s --preset -M visual -m default \e end-selection force-repaint

    # Make it easy to turn an unexecuted command into a comment in the shell history. Also, remove
    # the commenting chars so the command can be further edited then executed.
    bind -s --preset -M default \# __fish_toggle_comment_commandline
    bind -s --preset -M visual \# __fish_toggle_comment_commandline

    # Set the cursor shape
    # After executing once, this will have defined functions listening for the variable.
    # Therefore it needs to be before setting fish_bind_mode.
    fish_vi_cursor

    set fish_bind_mode $init_mode
end
