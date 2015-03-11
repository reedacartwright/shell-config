#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Evaluate SSH-Agent
[ -x /usr/bin/keychain ] && eval `keychain --quite --noask --eval id_dsa`
