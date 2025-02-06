# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.pixi/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/micromamba/bin"
export PATH="$PATH:/opt/ohpc/pub/apps/cuda/12.5/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/ohpc/pub/apps/cuda/12.5/lib64"

export HF_HOME='~/.cache/'
export PIP_CACHE_DIR='~/.cache/pip'
export NCCL_P2P_DISABLE=1 #ysds specific command  (for a6000 and rtx4090)
export NCCL_DEBUG=WARN
export VLLM_WORKER_MULTIPROC_METHOD=spawn
export BNB_CUDA_VERSION=125 #ysds specific command 

export CUDA_HOME='/opt/ohpc/pub/apps/cuda/12.5' #ysds specific command (for singularity)

alias jnb="jupyter notebook --ip 0.0.0.0 --no-browser"
alias conda="micromamba"
alias ca="micromamba activate"
alias cda="micromamba deactivate"
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


# alias sbash="srun --gres=gpu:1 --pty bash -i" #ysds specific command 
# alias sbash4="srun -p suma_rtx4090 -q base_qos --gres=gpu:1 --pty bash -i" #ysds specific command 
# alias sbasha="srun -p suma_a6000 -q base_qos --gres=gpu:1 --pty bash -i" #ysds specific command 
# alias sbasha1="srun -p suma_a100 -q a100_qos --gres=gpu:1 --pty bash -i" #ysds specific command 
# alias sq="squeue --format='%.7i %.9P %.15j %.8T %.10M %.10l %R'" #ysds specific command 
# alias chk_storage="sh ~/chk_storage.sh" #ysds specific command 
# alias chk_gpu="sh ~/chk_gpu.sh" #ysds specific command 
# alias chk_node="sh ~/chk_node.sh" #ysds specific command 
# alias sattach="srun --pty --overlap --jobid" #ysds specific command 
# alias run_simage="sh ~/start_instance.sh -f" #ysds specific command 
# alias run_instance="sh ~/start_instance.sh" #ysds specific command 
# alias stop_instance="sh ~/start_instance.sh -r" #ysds specific command 
# alias exec_instance="sh ~/start_instance.sh -e" #ysds specific command 

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
export MAMBA_EXE='$HOME/bin/micromamba';
export MAMBA_ROOT_PREFIX='$HOME/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

eval "$(starship init bash)"


. "$HOME/.cargo/env"
