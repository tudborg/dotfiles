# make less more friendly for non-text input files, see lesspipe(1)
if [ -x /usr/bin/lesspipe ]; then
	eval "$(SHELL=/bin/sh lesspipe)"
fi
