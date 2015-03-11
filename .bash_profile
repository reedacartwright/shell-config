#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Evaluate SSH-Agent
[ -x /usr/bin/keychain ] && eval `keychain --quiet --noask --eval id_rsa`
