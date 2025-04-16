#! /bin/bash

cd ~

# Install rust
echo "Installing rust..."
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

# Install micromamba
echo "Installing micromamba..."
mkdir -p ~/bin
curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba

# Install pixi
echo "Installing pixi..."
curl -fsSL https://pixi.sh/install.sh | bash

# apply fish config
echo "Applying fish config..."
mkdir -p ~/.config/fish
rm ~/.config/fish/config.fish
ln -s ~/sjk_dotfiles/config.fish ~/.config/fish/config.fish
source ~/.config/fish/config.fish

# apply bash config
echo "Applying bash config..."
rm ~/.bashrc
ln -s ~/sjk_dotfiles/bashrc ~/.bashrc
source ~/.bashrc

# Install eza and starship
echo "Installing eza and starship..."
cargo install eza starship

# Install nvitop
echo "Installing nvitop..."
pixi global install nvitop

#update starship config
echo "Updating starship config..."
rm ~/.config/starship.toml
ln -s ~/sjk_dotfiles/starship.toml ~/.config/starship.toml

#update tmux config
echo "Updating tmux config..."
rm ~/.config/tmux/tmux.conf
rm ~/.config/tmux/tmux.conf.local
ln -s ~/sjk_dotfiles/tmux.conf ~/.config/tmux/tmux.conf
ln -s ~/sjk_dotfiles/tmux.conf.local ~/.config/tmux/tmux.conf.local
tmux source-file ~/.config/tmux/tmux.conf

#update git config
echo "Updating git config..."
rm ~/.gitconfig
ln -s ~/sjk_dotfiles/.gitconfig ~/.gitconfig

source ~/.config/fish/config.fish
source ~/.bashrc

# how to add ssh key to github
# 1. ssh-keygen -t rsa -b 4096 -C "0110tpwls@gmail.com" #all enter
# 2. copy rsa.pub cat ~/.ssh/id_rsa.pub
# 3. go to github -> settings -> ssh and gpg keys -> new ssh key -> paste the rsa.pub content
# 4. ssh -T git@github.com
# 5. git config --global user.name "0110tpwls"
# 6. git config --global user.email "0110tpwls@gmail.com"