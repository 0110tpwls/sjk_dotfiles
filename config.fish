if status is-interactive
    # Commands to run in interactive sessions can go here
end

# fish_add_path $HOME/micromamba/bin
# fish_add_path $HOME/.local/bin
# set -gx PATH $HOME/micromamba/bin $PATH
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/.pixi/bin $PATH
set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH /opt/ohpc/pub/apps/cuda/12.5/bin $PATH
set -gx LD_LIBRARY_PATH /opt/ohpc/pub/apps/cuda/12.5/lib64 $LD_LIBRARY_PATH
# set -e PATH[ (contains -i /opt/conda/bin $PATH) ]
# set -gx LD_LIBRARY_PATH /opt/ohpc/pub/apps/cuda/12.5/targets/x86_64-linux/lib $LD_LIBRARY_PATH
# set -gx LD_LIBRARY_PATH /lib/x86_64-linux-gnu $LD_LIBRARY_PATH

# export HF_HOME='/scratch/jerry0110/hfCache'
export HF_HOME='~/.cache/'
export PIP_CACHE_DIR='~/.cache/pip'
export NCCL_P2P_DISABLE=1
export NCCL_DEBUG=WARN
export VLLM_WORKER_MULTIPROC_METHOD=spawn
export BNB_CUDA_VERSION=125

export CUDA_HOME='/opt/ohpc/pub/apps/cuda/12.5'
export CONDA_PREFIX=$CUDA_HOME

alias jnb="jupyter notebook --ip 0.0.0.0 --no-browser"
alias conda="micromamba"
alias ca="micromamba activate"
alias cda="micromamba deactivate"
# alias pi="pip install"
# alias piu="pip uninstall"
alias pi="pixi add"
alias pir="pixi remove"
alias pis="pixi shell"
alias ppi="pixi add --pypi"
alias ppir="pixi remove --pypi"

alias vi="vim"
alias tl="tmuxp load"
alias te="tmuxp edit"
alias ta="tmux attach -t"
alias ls="eza"
alias la="eza -lah"

# alias chk_storage="bash ~/chk_storage.sh"
# alias chk_gpu="bash ~/chk_gpu.sh"
# alias chk_node="bash ~/chk_node.sh"

starship init fish | source
pixi completion --shell fish | source

# >>> micromamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
set -gx MAMBA_EXE "$HOME/bin/micromamba";
set -gx MAMBA_ROOT_PREFIX "$HOME/micromamba";

eval "$MAMBA_EXE" shell hook --shell fish | source
# <<< micromamba initialize <<<
