	
# -------------------------------------
# Random things recommended by Broad IT
# -------------------------------------

# Default permissions (files = rw/rw/r, folders = rwx/rwx/r-x)
umask 002

stty -ixon -ixoff


# ------
# Dotkit
# ------
reuse -q default
reuse R-3.4
reuse UGER
use Java-1.7 # GATK
#use Java-1.8 # Picard
use Python-2.7
#use Python-3.4 # Phenograph
use Samtools
#use Picard-Tools
use "BLAST+"


# ----
# Path
# ----
CHOME='/home/unix/csmillie'
export PATH=$CHOME/bin:$CHOME/code/sge:.:$PATH
export R_LIBS=:$CHOME/lib/R:.:$R_LIBS
export LD_LIBRARY_PATH=$CHOME/lib:$LD_LIBRARY_PATH


# ---------------
# Python versions
# ---------------
export PYTHONPATH27=$CHOME/lib/python2.7/site-packages:$CHOME/code/sge:$PYTHONPATH:.
export PYTHONPATH34=$CHOME/lib/python3.4/site-packages:$CHOME/code/sge:$PYTHONPATH:.
alias py27='use Python-2.7; export PYTHONPATH=$PYTHONPATH27'
alias py34='use Python-3.4; export PYTHONPATH=$PYTHONPATH34'
export PYTHONPATH=$PYTHONPATH27


# -------------------------
# Interactive shell options
# -------------------------
if [ "${PS1:+set}" = set ]; then

        
	# ---------------
	# Custom settings
	# ---------------

	alias ls='ls --ignore-backups --color=auto'
	alias mega='stty -ixon -ixoff; ish'
	alias edit='emacs -nw'
	alias grep='GREP_COLOR="1;33;40" LANG=C grep --color=auto'
	PS1='\h:\w \$ '
	eval `dircolors ~/.dir_colors`
	
	
        # --------------
	# Broad defaults
	# --------------

        export EDITOR=emacs
	export VISUAL=$EDITOR
	export EXINIT="set ai aw sm"
	export FCINIT emacs
	export PAGER=less
	export LESS=-ce
	export MAIL=/usr/spool/mail/$USER
	export MAILCHECK=30
	export MAILFILE=$MAIL
	export PRINTER=lw

	alias	ll='ls -lg'
	alias	la='ls -A'
	alias	lla='ls -Alg'
	alias	passwd=yppasswd
	alias	sun='stty dec; stty erase \^H'
	alias	dec='stty dec'
	alias	xtitle='echo -n "]0;\!*"'
	
	
	# ------------------------------
	# Display settings for X11 plots
	# ------------------------------

	if [ ! -f ~/.qrsh.display ]; then
    	    touch ~/.qrsh.display
	fi

	display=$(echo $DISPLAY)
	if [[ $display != "" ]]; then
	    echo "export DISPLAY="$DISPLAY > ~/.qrsh.display
	fi
	source ~/.qrsh.display
fi


# ---------
# Functions
# ---------

cmega(){
ish -q interactive -l h_vmem=64g; set -g status-bg yellow;
}

mmega(){
ssh -t -Y mbiton@gold "tmux new \; send-keys \"ish -q interactive -l h_vmem=64g\" Enter \; set -g status-bg blue"
}

emega(){
ssh -t -Y eugened@gold "tmux new \; send-keys \"ish -q interactive -l h_vmem=64g\" Enter \; set -g status-bg red"
}

nmega(){
ssh -t -Y nrogel@gold "tmux new \; send-keys \"ish -q interactive -l h_vmem=64g\" Enter \; set -g status-bg pink"
}
