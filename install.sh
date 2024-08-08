#!/bin/bash

echo "Installing ZSH"
sudo apt install zsh
echo "exec zsh" >> ~/.bashrc

echo "Adding OhMyZSH + P10K and their respective configurations"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh already installed."
fi

# Install Oh My Zsh plugins
echo "Installing Oh My Zsh plugins..."
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
    echo "zsh-syntax-highlighting plugin already installed."
fi
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
    echo "zsh-autosuggestions plugin already installed."
fi

# Install Powerlevel10k if not installed
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    echo "Installing Powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
else
    echo "Powerlevel10k theme already installed."
fi

echo "Installing P10K Configuration"
rm ~/.p10k.zsh
cp .p10k.zsh ~/.p10k.zsh

echo "Installing languages"
sudo apt install golang
sudo apt install rust
sudo apt install python3
alias py=python3
echo "alias py=python3" >> ~/.zshrc

echo "Installing neovim configuration"
rm -rf ~/.config/nvim

cp -r nvim_configuration ~/.config/nvim


echo "Installing Zoxide"
sudo apt install zoxide
echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc
eval "$(zoxide init zsh)"

echo "Finished LazySeal setup."
