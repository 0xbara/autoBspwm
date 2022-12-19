#!/usr/bin/env bash

green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
turquoise="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

function banner(){
	echo -e "${red}"
	echo -e "		      $$\               $$\                                                       "
	echo -e "	              $$ |              $$ |                                                      "
	echo -e	" $$$$$$\  $$\   $$\ $$$$$$\    $$$$$$\  $$$$$$$\   $$$$$$$\  $$$$$$\  $$\  $$\  $$\ $$$$$$\$$$$\  "
	echo -e	" \____$$\ $$ |  $$ |\_$$  _|  $$  __$$\ $$  __$$\ $$  _____|$$  __$$\ $$ | $$ | $$ |$$  _$$  _$$\ "
	echo -e	" $$$$$$$ |$$ |  $$ |  $$ |    $$ /  $$ |$$ |  $$ |\$$$$$$\  $$ /  $$ |$$ | $$ | $$ |$$ / $$ / $$ |"
	echo -e	"$$  __$$ |$$ |  $$ |  $$ |$$\ $$ |  $$ |$$ |  $$ | \____$$\ $$ |  $$ |$$ | $$ | $$ |$$ | $$ | $$ |"
	echo -e	"\$$$$$$$ |\$$$$$$  |  \$$$$  |\$$$$$$  |$$$$$$$  |$$$$$$$  |$$$$$$$  |\$$$$$\$$$$  |$$ | $$ | $$ |"
	echo -e	" \_______| \______/    \____/  \______/ \_______/ \_______/ $$  ____/  \_____\____/ \__| \__| \__|"
        echo -e	"                                                            $$ |                                  "
        echo -e	"                                                            $$ |                                  "
	echo -e	"                                                            \__|         (by barambolas)          "


}

function main(){
	
	banner
	sleep 0.2

	echo -e "${purple}"
	echo -e "Which of this OS do you use?"
	sleep 0.2

	echo
	echo -e "1 - Kali Linux"
	sleep 0.2

	echo
	echo -e "2 - Ubuntu"
	sleep 0.2

	echo
	echo -e "3 - Parrot OS"
	sleep 0.2

	echo
	echo -e "4 - Debian based"
	sleep 0.2

	echo
	read -p "Option: " option
	echo -e "${end}"

	if [ "$opiton" == "1" ]; then
	kali
	fi

	if [ "$option" == "2" ]; then
	debian
	fi

	if [ "$option" == "3" ]; then
	parrot
	fi

	if [ "$option" == "4" ]; then
	debian
	fi
}

function kali(){
echo -e "${green}[*]${end} Installing packages..."
sleep 1

sudo parrot-upgrade
sudo apt install kitty zsh zsh-autosuggestions zsh-syntax-highlighting bat xclip
sleep 1

sudo usermod --shell /usr/bin/zsh root

usermod --shell /usr/bin/zsh $USER

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

wget https://github.com/Peltoche/lsd/releases/download/0.23.1/lsd_0.23.1_amd64.deb 
sudo dpkg -i lsd_0.23.1_amd64.deb
}

if [ "$(id -u)" == "0" ]; then
	
    echo -e "\n${red}[!] Please, run the tool again with your normal user${end}"
	echo
	exit 1
else
	main
fi
