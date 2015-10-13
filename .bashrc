#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# some ideas
# https://gist.github.com/tommybutler/6954156

# put timestamps in my bash history
export HISTTIMEFORMAT='%F %T '
 
# don't put duplicate commands into the history
export HISTCONTROL=ignoredups
 
# record only the most recent duplicated command (see above)
export HISTCONTROL=ignoreboth
 
# don't record these commands in the history; who cares about ls?
export HISTIGNORE='pwd:ls:history:'
 
# keep the history size up to 4096 lines
export HISTSIZE=4096 

type -p nano >/dev/null && export EDITOR=nano
type -p less >/dev/null && export PAGER=less
export LESS="--RAW-CONTROL-CHARS --chop-long-lines --quit-if-one-screen --ignore-case --LONG-PROMPT --SILENT --no-init"

# add user bin directory
[[ -d "${HOME}/bin" ]] && export PATH="${PATH}:${HOME}/bin"

# list directories with color
if [ `uname` == Linux ]; then
  eval `dircolors`
  alias ls='ls -F --color=auto'
  alias ll='ls -lhA'
  alias la='ls -A'
else
  export CLICOLOR=yes
  export LSCOLORS=ExGxcxdxCxegedCxCxExEx
  alias ls='ls -F'
  alias la='ls -FA'
  alias ll='ls -FlThoA'
fi

# highlight grep matches with color
alias grep='grep --color=auto'
 
# shortcut aliases for the grep command with different behaviors
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# how much memory is the given command name using? for example: howmuchmem vmware
howmuchmem () { PROCNAME="$@"; echo $PROCNAME IS USING $(echo "scale=4; ($(ps axo rss,comm|grep $PROCNAME| awk '{ TOTAL += $1 } END { print TOTAL }')/$(free | head -n 2 | tail -n 1 | awk '{ print $2 }'))*100"|bc)% of system RAM; };
 
# recursively change ownership of the given file or files, to the current user and group
alias chme='sudo chown -R $USER:$USER'
 
# show how many processes each user is running
alias procperuser='ps ax -o user | sort | uniq -c | sort -nr'
 
# show the processes consuming the most memory
memhogs () { TR=`free|grep Mem:|awk '{print $2}'`;ps axo rss,comm,pid|awk -v tr=$TR '{proc_list[$2]+=$1;} END {for (proc in proc_list) {proc_pct=(proc_list[proc]/tr)*100; printf("%d\t%-16s\t%0.2f%\n",proc_list[proc],proc,proc_pct);}}'|sort -n |tail -n 10; };

if [[ $EUID -ne 0 ]]; then 
# Green for users
  PS1='\[\e[1;32m\][\u@\h \W\[\e[0m\]`[ $? == 0 ] || echo " \[\e[1;91m\]\\\\$?=$?\[\e[0m\]"`\[\e[1;32m\]]\$\[\e[0m\] '
else
# red for root
  PS1='\[\e[1;31m\][\u@\h \W\[\e[0m\]`[ $? == 0 ] || echo " \[\e[1;92m\]\\\\$?=$?\[\e[0m\]"`\[\e[1;31m\]]\$\[\e[0m\] '
fi

[[ -f /etc/profile.d/vte.sh ]] && . /etc/profile.d/vte.sh

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Execute ssh-add when ssh is first run
#ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'

# alias for working with Dropbox work directory
alias dropbox-work-cli='HOME=$HOME/.dropbox-work dropbox-cli'

#gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf input.pdf

#remove BOM if it exists
alias removebom="awk '{if(NR==1)sub(/^\xef\xbb\xbf/,\"\");print}'"
