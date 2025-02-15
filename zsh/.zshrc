# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
	source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
	source /usr/share/zsh/manjaro-zsh-prompt
fi

HISTSIZE=1000
HISTFILESIZE=2000

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo
		echo
	done
}

#============ Aliases =============
alias p="sudo pacman"
alias wclone="wget --mirror --convert-links --adjust-extension --page-requisites --no-parent "
alias dirtCheck="watch grep Dirty /proc/meminfo"
alias makeGif="convert -delay 0 -loop 0 -alpha set -dispose previous "
alias pingg="ping 8.8.4.4"
alias normalMapConvert="convert input -channel green -negate +channel output"
alias ipshow="ip -brief address show"
alias ippshow="wget -q -O- http://ipecho.net/plain"
alias mX="rmatrix -C red"

alias lartisanReseed="php artisan migrate:fresh --seed"
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
alias qclPOSRdesktop="rdesktop 192.168.0.100 -u Administrator -p QuettaClub1891 -r disk:share=./"
alias maria="sudo systemctl start mariadb"
alias npartisan="npm run dev & php artisan serve"
alias paclear="php artisan cache:clear;php artisan config:clear;php artisan route:clear;php artisan view:clear;"

source /usr/share/nvm/init-nvm.sh

# hisab vars
export zameenAcre=239.0
export zameenQilla=160.0

export project="/home/gc/dev/inventory"
export PATH=$PATH:/home/gc/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/gc/dev/scripts:/home/gc/.config/composer/vendor/bin

PATH="/home/gc/perl5/bin${PATH:+:${PATH}}"
export PATH
PERL5LIB="/home/gc/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL5LIB
PERL_LOCAL_LIB_ROOT="/home/gc/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_LOCAL_LIB_ROOT
PERL_MB_OPT="--install_base \"/home/gc/perl5\""
export PERL_MB_OPT
PERL_MM_OPT="INSTALL_BASE=/home/gc/perl5"
export PERL_MM_OPT
