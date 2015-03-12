#
# ~/.bash_profile
#

[[ -f ~/.profile ]] && . ~/.profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Evaluate SSH-Agent
[[ -x /usr/bin/keychain ]] && eval $(/usr/bin/keychain --agents ssh --quick --quiet --eval id_rsa)
