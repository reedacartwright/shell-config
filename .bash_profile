#
# ~/.bash_profile
#

[[ -f ~/.profile ]] && . ~/.profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Evaluate SSH-Agent
hash keychain 2>/dev/null && eval $(keychain --agents ssh --quick --quiet --eval id_rsa)

: # Set clean Exit status

