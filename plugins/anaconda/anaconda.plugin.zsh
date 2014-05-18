# Append Anaconda install location to path
export PATH=$HOME/$ANACONDA/bin:$PATH

# Append additional paths
# From http://earthwithsun.com/questions/598810/zsh-config-to-export-or-not-to-export
typeset -U path
path=($ANACONDA_ADDITIONAL_PATHS $path)
export path

VIRTUALENVWRAPPER_PYTHON=/usr/bin/python

# Aliases
alias cn.sa='source activate'
alias cn.sd='source deactivate'
