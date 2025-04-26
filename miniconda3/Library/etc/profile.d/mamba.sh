export MAMBA_ROOT_PREFIX="C:/Users/stone/miniconda3/Library"
__mamba_setup="$("C:/Users/stone/miniconda3/Library/bin/mamba" shell hook --shell posix 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="C:/Users/stone/miniconda3/Library/bin/mamba"  # Fallback on help from mamba activate
fi
unset __mamba_setup
