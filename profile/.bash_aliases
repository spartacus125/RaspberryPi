#################
# SHELL ALIASES #
#################

alias ll='ls -la'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias reboot='sudo reboot'
alias update='sudo apt-get -y update && sudo apt-get -y upgrade'
alias install='sudo apt-get install'
alias instally='sudo apt-get -y install'
alias now='date + %T'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias ping='ping -c 5'
alias ports='netstat -tulanp'

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'
 
# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
 
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

##################
# DAEMAN ALIASES #
##################

alias servoblaster='/etc/init.d/servoblaster'
alias gmediarenderer='/etc/init.d/gmediarenderer'

#################
# MEDIA ALIASES #
#################

# Increase volume by 5%
alias volu='sudo amixer set PCM -- $[$(amixer get PCM|grep -o [0-9]*%|sed 's/%//')+5]%'
# Decrease volume by 5%
alias vold='sudo amixer set PCM -- $[$(amixer get PCM|grep -o [0-9]*%|sed 's/%//')-5]%'

