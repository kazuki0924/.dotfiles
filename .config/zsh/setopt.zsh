# smart urls
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# auto cd
setopt AUTO_CD
cdpath=(.. ~ ~/src ~/.dotfiles ~/.dotscripts)

# general
setopt brace_ccl       # Allow Brace Character Class List Expansion.
setopt combining_chars # Combine Zero-Length Punctuation Characters ( Accents ) With The Base Character.
setopt rc_quotes       # Allow 'Henry''s Garage' instead of 'Henry'\''s Garage'.
unsetopt mail_warning  # Don't Print A Warning Message If A Mail File Has Been Accessed.

# jobs
setopt long_list_jobs # List Jobs In The Long Format By Default.
setopt auto_resume    # Attempt To Resume Existing Job Before Creating A New Process.
setopt notify         # Report Status Of Background Jobs Immediately.
unsetopt bg_nice      # Don't Run All Background Jobs At A Lower Priority.
unsetopt hup          # Don't Kill Jobs On Shell Exit.
unsetopt check_jobs   # Don't Report On Jobs When Shell Exit.

# history
HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"
HISTSIZE=100000
SAVEHIST=5000

setopt append_history       # Allow multiple terminal sessions to all append to one zsh command history
setopt hist_ignore_all_dups # delete old recorded entry if new entry is a duplicate.
setopt no_beep              # do not beep on error
setopt auto_cd              # If you type foo, and it is not a command, and it is a directory in your cdpath, go there
setopt multios              # perform implicit tees or cats when multiple redirections are attempted
setopt prompt_subst         # enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt interactive_comments # Allow comments even in interactive shells (especially for Muness)
setopt pushd_ignore_dups    # don't push multiple copies of the same directory onto the directory stack
setopt auto_pushd           # make cd push the old directory onto the directory stack
setopt pushdminus           # swapped the meaning of cd +1 and cd -1; we want them to mean the opposite of what they mean
setopt pushd_silent         # Silence pushd
setopt glob_dots            # Show dotfiles in completions

setopt bang_hist              # Treat The '!' Character Specially During Expansion.
setopt inc_append_history     # Write To The History File Immediately, Not When The Shell Exits.
setopt share_history          # Share History Between All Sessions.
setopt hist_expire_dups_first # Expire A Duplicate Event First When Trimming History.
setopt hist_ignore_dups       # Do Not Record An Event That Was Just Recorded Again.
setopt hist_ignore_all_dups   # Delete An Old Recorded Event If A New Event Is A Duplicate.
setopt hist_find_no_dups      # Do Not Display A Previously Found Event.
setopt hist_ignore_space      # Do Not Record An Event Starting With A Space.
setopt hist_save_no_dups      # Do Not Write A Duplicate Event To The History File.
setopt hist_verify            # Do Not Execute Immediately Upon History Expansion.
setopt extended_history       # Show Timestamp In History.

setopt extended_glob
setopt complete_in_word
setopt list_packed
setopt hist_beep
setopt appendhistory notify
unsetopt beep nomatch
