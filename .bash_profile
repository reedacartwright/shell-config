#
# ~/.bash_profile
#

[[ -f ~/.profile ]] && . ~/.profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Evaluate SSH-Agent
hash keychain 2>/dev/null && eval $(keychain --agents ssh --quick --quiet --eval id_rsa)

if [ -n "${DESKTOP_SESSION}" ]; then
  eval $(gnome-keyring-daemon --start)
  export SSH_AUTH_SOCK
fi

: # Set clean Exit status
