# Append Anaconda install location to path
export PATH=$HOME/$ANACONDA/bin:$PATH

declare -U pythonpath

# Append additional paths to PYTHONPATH
# From http://earthwithsun.com/questions/598810/zsh-config-to-export-or-not-to-export
function update_pythonpath() {
    pythonpath=($ANACONDA_ADDITIONAL_PATHS $pythonpath)
}

function cnsa() {
    source activate "$1" && update_pythonpath
}

VIRTUALENVWRAPPER_PYTHON=/usr/bin/python

# Aliases
alias cn.sa='cnsa'
alias cn.sd='source deactivate'
