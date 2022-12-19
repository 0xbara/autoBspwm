#!/usr/bin env bash

sudo parrot-upgrade

sudo apt install kitty zsh zsh-autosuggestions zsh-syntax-highlighting bat xclip

sudo usermod --shell /usr/bin/zsh root

sudo usermod --shell /usr/bin/zsh $USER

sudo rm -rf ~/.config/nvim 2>/dev/null

sudo rm -rf ~/.config/kitty 2>/dev/null

mv files/kitty ~/.config/

mv files/nvim ~/.config/

sudo mv files/HackFonts/* /usr/share/fonts

sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/powerlevel10k
sudo echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> /root/.zshrc

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

rm -rf ~/.zshrc 

mv files/.zshrc ~/

sudo ln -s -f ~/.zshrc /root/.zshrc
