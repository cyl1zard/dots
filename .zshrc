export ZSH=/home/buslique/.oh-my-zsh
export EDITOR=vim
export QT_QPA_PLATFORMTHEME=qt5ct

ZSH_THEME="blinks"
HIST_STAMPS="dd.mm.yyyy"

plugins=(archlinux nmap pass sublime vim-interaction zsh-navigation-tools)
source $ZSH/oh-my-zsh.sh

# user configuration
[[ -a $(whence -p pacman-color) ]] && compdef _pacman pacman-color=pacman

# editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi


# extract/pack archives
extract () {
 if [ -f $1 ] ; then
 case $1 in
 *.tar.bz2)   tar xjf $1      ;;
 *.tar.gz)    tar xzf $1      ;;
 *.tar.xz)    tar xpvf $1     ;;
 *.bz2)       bunzip2 $1      ;;
 *.rar)       unrar x $1      ;;
 *.gz)        gunzip $1       ;;
 *.tar)       tar xf $1       ;;
 *.tbz2)      tar xjf $1      ;;
 *.tgz)       tar xzf $1      ;;
 *.zip)       unzip $1        ;;
 *.Z)         uncompress $1   ;;
 *.7z)        7z x $1		  ;;
 *.tbz)       tar xjvf  	  ;;
 *)           echo "wtf '$1'" ;;
 esac
 else
 echo "'$1' is not a valid file"
 fi
}

pk () {
 if [ $1 ] ; then
 case $1 in
 tbz)       tar cjvf $2.tar.bz2 $2      ;;
 tgz)       tar czvf $2.tar.gz  $2      ;;
 tar)       tar cpvf $2.tar  $2       	;;
 bz2)       bzip $2 			;;
 gz)        gzip -c -9 -n $2 > $2.gz 	;;
 zip)       zip -r $2.zip $2   		;;
 7z)        7z a $2.7z $2    		;;
 *)         echo "'$1' cant pack pk()" 	;;
 esac
 else
 echo "'$1' is not a valid file"
 fi
}


# Aliases
alias m="ncmpcpp"
alias diff="diff --color=auto"
alias pacman="pacman --color=auto"
alias spacman="sudo pacman --color=auto"
alias a="alsamixer"
alias p="pavucontrol"
alias s="mpdscribble"
alias cp="cp -vi"
alias mv="mv -vi"
alias rm="rm -vi"
alias torbrowser="cd /opt/tor-browser_en-US/ && ./start-tor-browser.desktop"
alias -s {avi,mkv,mov,mp4,flv}=mpv
alias cr="pkill conky && conky -d"
alias aa="pkill mplayer"
alias sr="streamlink --player mpv --player-passthrough hls"alias mvim=vim
alias scan="systemctl force-reload minidlna"