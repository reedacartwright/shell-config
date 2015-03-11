#
# ~/.bash_profile
#

# Evaluate SSH-Agent
[[ -x /usr/bin/keychain ]] && eval $(keychain --agents ssh --quick --quiet --noask --eval id_rsa)

# Run Bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
