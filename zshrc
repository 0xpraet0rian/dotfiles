
# ZSH Modules
    autoload -U compinit promptinit zsh-mime-setup colors
    compinit
    promptinit
    zsh-mime-setup
    colors

# Options
    # why type cd dir, just type dir
    setopt AUTO_CD
    # No unnecessary slashes
    setopt AUTO_REMOVE_SLASH
    # pipe to multiple outputs
    setopt MULTIOS
    # spell check commands
    setopt CORRECT
    # expand glos when possible
    setopt GLOB_COMPLETE
    # case insensitive glob
    setopt NO_CASE_GLOB
    # extended glob
    setopt EXTENDED_GLOB
    setopt NUMERIC_GLOB_SORT
    # no beeps
    setopt NO_BEEP
    # careful with rm
    setopt RM_STAR_WAIT
    # color ls
    eval `dircolors -b`
    # append history, don't overwrite
    setopt APPEND_HISTORY
    # no duplicate entries
    setopt HIST_IGNORE_DUPS
    # save hist space
    setopt HIST_REDUCE_BLANKS

# Completion
    # faster?
    zstyle ':completion::complete:*' use-cache 1
    # case insensitive
    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

    zstyle ':completion:*' verbose yes
    # for PID
    zstyle ':completion:*:*:kill:*' menu yes select
    zstyle ':completion:*:kill:*' force-list always
    # color completion
    zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"
    # separate man page sections
    zstyle ':completion"*"manuals' separate-sections true
    # don't complete current directory
    zstyle ':completion:*' ignore-parents parent pwd

# History
    HISTFILE=~/.histfile
    SAVEHIST=10000
    HISTSIZE=10000

# Exports
    export LANG=en_US.utf8
    export XDG_DATA_HOME=/home/mark/.config
    export ARCH=x86_64
    export EDITOR=nano
    export BROWSER=firefox
    export GREP_COLOR="1;33"
    export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/mark/bin:/tmp/path

# Prompt
# ======
# bira theme oh my zsh
# ====================

setopt prompt_subst
setopt promptsubst
setopt promptpercent

autoload colors; colors;

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local user_host='%{$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$fg[blue]%}%~%{$reset_color%}'

local git_branch='$(git_prompt_info)%{$reset_color%}'

RPROMPT="[%{$fg[green]%}%@%{$reset_color%}] ${return_code}%{$reset_color%}"
PROMPT="┌─╸[${user_host}]—[${current_dir}]${git_branch}
└───╸%B%b "

ZSH_THEME_GIT_PROMPT_SUFFIX=""

# Git Prompt
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "—[%{$fg[yellow]%}${ref#refs/heads/}%{$reset_color%}]"
}

if [[ `uname` == 'Linux' ]]
then
    local user_host='%{$fg[yellow]%}%n@%m%{$reset_color%}'
    local current_dir='%{$fg[green]%}%~%{$reset_color%}'
    RPROMPT="[%{$fg[yellow]%}%@%{$reset_color%}] ${return_code}%{$reset_color%}"
    PROMPT="┌─╸[${user_host}]—[${current_dir}]${git_branch}
└───╸%B%b "
fi

#######################################################################
############################### Aliases ###############################
#######################################################################
    alias la='ls -a'
    alias lh='ls -lh'
    alias lah='ls -lah'
    alias -g ls='ls --classify --tabsize=0 --literal --color=auto --show-control-chars --human-readable --group-directories-first'
    alias -g G='| grep'
    alias shutdown='sudo shutdown -h now'
    alias locate='locate -i -e'
    alias music='ncmpcpp'
	alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
# Directory Stuff
	alias rd='rm -rf'
	alias md='mkdir -p'

	alias ..='cd ..'
	alias ..='cd ..'
	alias ...='cd ../..'
	alias ....='cd ../../..'
	alias .....='cd ../../../..'
	alias cd/='cd /'
# Chmod Chown & Chgrp
	alias chx="sudo chmod +x" #make a file executable
	alias chm="sudo chmod"
	alias chm7="sudo chmod 777"
	alias chm75="sudo chmod 755"
	alias chmr="sudo chmod -R"
	alias chmr7="sudo chmod -R 777"
	alias chmr75="sudo chmod -R 755"
	alias cho="sudo chown"
	alias chor="sudo chown -R"
	alias chg="sudo chgrp"
	alias chgr="sudo chgrp -R"
#network alias
	alias sshlogs="journalctl -u sshd"
#mount_alias
	alias mountp1="sudo mount -t ntfs-3g /dev/sda2 /home/mark/mnt/part1"
	alias mountp2="sudo mount -t ntfs-3g /dev/sda3 /home/mark/mnt/part2"

# Suffixes
    alias -s pdf='apvlv'
    alias -s {jpg,png,gif}='feh'
    alias -s {wmv,mp4,avi,flv,mkv,mp3,ogg,flac,wav}='mplayer'
    alias -s py='python'

# Make coreutils more verbose
    for c in cp rm chmod chown rename; do
        alias $c="$c -v"
    done

# ls on cd
    cd() {builtin cd $@; ls }
