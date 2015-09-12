function fish_prompt

	set last_status $status

	if not set -q __fish_git_prompt_show_informative_status
		set -g __fish_git_prompt_show_informative_status 1
	end
	if not set -q __fish_git_prompt_hide_untrackedfiles
		set -g __fish_git_prompt_hide_untrackedfiles 1
	end

	if not set -q __fish_git_prompt_color_branch
		set -g __fish_git_prompt_color_branch magenta --bold
	end
	if not set -q __fish_git_prompt_showupstream
		set -g __fish_git_prompt_showupstream "informative"
	end
	if not set -q __fish_git_prompt_char_upstream_ahead
		set -g __fish_git_prompt_char_upstream_ahead "↑"
	end
	if not set -q __fish_git_prompt_char_upstream_behind
		set -g __fish_git_prompt_char_upstream_behind "↓"
	end
	if not set -q __fish_git_prompt_char_upstream_prefix
		set -g __fish_git_prompt_char_upstream_prefix ""
	end

	if not set -q __fish_git_prompt_char_stagedstate
		set -g __fish_git_prompt_char_stagedstate "●"
	end
	if not set -q __fish_git_prompt_char_dirtystate
		set -g __fish_git_prompt_char_dirtystate "✚"
	end
	if not set -q __fish_git_prompt_char_untrackedfiles
		set -g __fish_git_prompt_char_untrackedfiles "…"
	end
	if not set -q __fish_git_prompt_char_conflictedstate
		set -g __fish_git_prompt_char_conflictedstate "✖"
	end
	if not set -q __fish_git_prompt_char_cleanstate
		set -g __fish_git_prompt_char_cleanstate "✔"
	end

	if not set -q __fish_git_prompt_color_dirtystate
		set -g __fish_git_prompt_color_dirtystate blue
	end
	if not set -q __fish_git_prompt_color_stagedstate
		set -g __fish_git_prompt_color_stagedstate yellow
	end
	if not set -q __fish_git_prompt_color_invalidstate
		set -g __fish_git_prompt_color_invalidstate red
	end
	if not set -q __fish_git_prompt_color_untrackedfiles
		set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
	end
	if not set -q __fish_git_prompt_color_cleanstate
		set -g __fish_git_prompt_color_cleanstate green --bold
	end

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	set_color purple
	echo -n (date "+%y-%m-%d %H:%M")" "

	set_color blue
	echo -n (whoami)

	set_color normal
	echo -n " at "
	
	set_color yellow
	echo -n (hostname)

	set_color normal
	echo -n " in "

	set_color blue
	echo -n (prompt_pwd)
	
	set_color normal
	printf '%s ' (__fish_git_prompt)
	echo ""

	set_color normal
	if not test $last_status -eq 0
		set_color red
	end

	echo -n "=> "
end
