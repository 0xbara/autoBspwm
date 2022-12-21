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
	echo -e "┌─┐┬ ┬┌┬┐┌─┐┌┐ ┌─┐┌─┐┬ ┬┌┬┐"
	echo -e "├─┤│ │ │ │ │├┴┐└─┐├─┘││││││"
	echo -e "┴ ┴└─┘ ┴ └─┘└─┘└─┘┴  └┴┘┴ ┴ (by barambolas)"
}

function main(){
	
	banner
	sleep 0.2

	echo -e "${yellow}"
	echo -e "Which of this OS do you use?"
	sleep 2

	echo
	echo -e "1 - Ubuntu"
	sleep 0.2

	echo
	echo -e "2 - Parrot OS"
	sleep 0.2

	echo
	echo -e "3 - Debian based"
	sleep 0.2

	echo
	read -p "Option: " option
	echo -e "${end}"

	if [ "$option" == "1" ]; then
	debian
	fi

	if [ "$option" == "2" ]; then
	parrot
	fi

	if [ "$option" == "3" ]; then
	debian
	fi

}

function quest(){    
	
	echo -e "${yellow}"
	read -p "Have you finished configuring the Powerlevel10k? (y or n): " p10k
	echo -e "${end}"
          
        if [ "$p10k" == "y" ]; then
        	bspwm
        fi
          
        if [ "$p10k" == "n" ]; then
        	quest
        fi

	if [ "$p10k" == "Y" ]; then  
                bspwm  
        fi  
            
  	if [ "$p10k" == "N" ]; then  
                quest  
        fi
} 

function debian(){
  
	echo -e "${green}[*] Installing packages...${end}"
        sleep 1
  
	sudo apt update && sudo apt upgrade -y
        sudo apt install kitty zsh zsh-autosuggestions zsh-syntax-highlighting bat xclip -y
        sleep 1
  
        sudo usermod --shell /usr/bin/zsh root
  
        usermod --shell /usr/bin/zsh $USER
  	export SHELL=/usr/bin/zsh

        sudo rm -rf ~/.config/nvim 2>/dev/null
	sudo rm -rf ~/.config/kitty 2>/dev/null
  
        mv files/kitty ~/.config/
        mv files/nvim ~/.config/
        sudo cp -r ~/.config/nvim /root/.config
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
          
        echo -e "${blue}[*] Powerlevel10k installed successfully${end}"
        sleep +1
  
        echo -e "${red}[!] Attention, a pop-up window with the kitty terminal will appear, please configure your user $(echo $USER) and root${end}"
        sleep 5
  
        kitty && quest
          
}

function parrot(){
  
	echo -e "${green}[*] Installing packages...${end}"
	sleep 1
  
        sudo parrot-upgrade
	sudo apt install kitty zsh zsh-autosuggestions zsh-syntax-highlighting bat xclip -y
        sleep 1
  
        sudo usermod --shell /usr/bin/zsh root
  
        usermod --shell /usr/bin/zsh $USER
  	export SHELL=/usr/bin/zsh

        sudo rm -rf ~/.config/nvim 2>/dev/null
        sudo rm -rf ~/.config/kitty 2>/dev/null
  
        mv files/kitty ~/.config/
        mv files/nvim ~/.config/
        sudo cp -r ~/.config/nvim /root/.config
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
          
        echo -e "${blue}[*] Powerlevel10k installed successfully${end}"
        sleep +1
  
	echo -e "${red}[!] Attention, a pop-up window with the kitty terminal will appear, please configure your user $(echo $USER) and root${end}"
        sleep 5
  
        kitty && quest
          
}

function bspwm(){

	echo -e "${green}[*] Installing bspwm${end}"
	sleep 1

	sudo apt install net-tools libuv1-dev build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev -y
	sudo apt install cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libnl-genl-3-dev -y
	sudo apt install meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev -y
	sudo apt install bspwm rofi caja feh scrot neovim acpi scrub -y

	echo -e "${blue}[*] Requirements installed successfully${end}"
	sleep 1

	git clone https://github.com/baskerville/bspwm.git
	mv bspwm/* .
	sudo rm -rf bspwm/
	make
	sudo make install
	sudo rm -rf artworks/ contrib/ doc/ src/ tests/ bspc bspc.o bspwm bspwm.o desktop.o events.o ewmh.o geometry.o helpers.o history.o jsmn.o LICENSE Makefile messages.o monitor.o parse.o pointer.o query.o README.md restore.o rule.o settings.o Sourcedeps stack.o subscribe.o tree.o VERSION window.o
	git clone https://github.com/baskerville/sxhkd.git
	mv sxhkd/* .
	sudo rm -rf sxhkd/
	make
	sudo make install

	mkdir ~/.config/bspwm
	mkdir ~/.config/sxhkd
	cp examples/bspwmrc ~/.config/bspwm/

	chmod +x ~/.config/bspwm/bspwmrc
	cp examples/sxhkdrc ~/.config/sxhkd/

	sudo rm -rf contrib/ doc/ examples/ src/ grab.o helpers.o LICENSE Makefile parse.o README.md Sourcedeps sxhkd sxhkd.o types.o VERSION
	cp files/sxhkdrc ~/.config/sxhkd

	echo -e "${blue}[*] Bspwm installed successfully${end}"
	sleep 1

	git clone --recursive https://github.com/polybar/polybar
	mv polybar/* .
	sudo rm -rf polybar/
	cmake .
	make -j$(nproc)
	sudo make install

	sudo rm -rf bin/ cmake/ CMakeFiles/ common/ config/ contrib/ doc/ generated-sources/ include/ lib/ libs/ polybar/ src/ tests/ banner.png build.sh CHANGELOG.md CMajeCache.txt cmake_install.cmake CMakeLists.txt compile_commands.json CONTRIBUTING.md install_manifest LICENSE Makefile README.md SUPPORT.md version.txt

	git clone https://github.com/ibhagwan/picom.git
	mv picom/* .
	sudo rm -rf picom/
	git submodule update --init --recursive
	meson --buildtype=release . build
	ninja -C build
	sudo ninja -C build install

	sudo rm -rf *.md *.conf *.desktop *.txt *.build *.spdx *.glsl COPYING Doxyfile CONTRIBUTORS bin/ build/ dbus-examples/ LICENSES/ man/ media/ meson/ src/ subprojects/ tests/

	mkdir ~/.wallpapers
	cp files/wallpaper.jpg ~/.wallpapers
	echo 'feh --bg-fill ~/.wallpapers/wallpaper.jpg' >> ~/.config/bspwm/bspwmrc
	echo 'xsetroot -cursor_name left_ptr &' >> ~/.config/bspwm/bspwmrc
	echo 'wmname LG3D &' >> ~/.config/bspwm/bspwmrc

	git clone https://github.com/VaughnValle/blue-sky.git
	mkdir ~/.config/polybar

	cp files/polybar.zip .
	unzip polybar.zip
	sudo mv polybar-backup/ ~/.config/
	sudo rm -rf ~/.config/polybar/ 2>/dev/null
	sudo mv ~/.config/polybar-backup/ ~/.config/polybar/
	echo '~/.config/polybar/./launch.sh' >> ~/.config/bspwm/bspwmrc

	mkdir ~/.config/picom
	echo 'bspc config focus_follows_pointer true' >> ~/.config/bspwm/bspwmrc

	cp files/picom.conf ~/.config/picom

	echo 'bspc config border_width 0' >> ~/.config/bspwm/bspwmrc
	
	mkdir ~/.config/bin
	
	echo 'picom --experimental-backends &' >> ~/.config/bspwm/bspwmrc

	sudo cp ~/.config/polybar/fonts/* /usr/share/fonts

	wget https://raw.githubusercontent.com/yorkox0/exaple01/main/ethernet_status.sh
	chmod +x ethernet_status.sh 2>/dev/null
	mv ethernet_status.sh ~/.config/bin
	wget https://raw.githubusercontent.com/yorkox0/exaple01/main/hackthebox.sh
	chmod +x hackthebox.sh
	mv hackthebox.sh ~/.config/bin
	cp files/target_to_hack.sh .
	chmod +x target_to_hack.sh
	mv target_to_hack.sh ~/.config/bin
	echo '' > ~/.config/bin/target
	chmod +x files/battery.sh
	mv files/battery.sh ~/.config/bin/
	echo '' > ~/.config/bin/target

	mkdir ~/.config/rofi
	mkdir ~/.config/rofi/themes
	cp blue-sky/nord.rasi ~/.config/rofi/themes

	sudo cp files/settarget /bin
	sudo cp files/cleartarget /bin
	sudo chmod +x /bin/settarget
	sudo chmod +x /bin/cleartarget

	chown -R root:root /usr/local/share/zsh/site-functions/_bspc
	chown -R root:root /usr/local/share/zsh/site-functions

	echo -e "${blue}[*] Enviroment ready!${end}"
	sleep 1
	echo -e "${red}[!] To use it, log out and change the Desktop Enviroment${end}"
	sleep 1
	echo -e "${green}[?] For any other doubt, go to my Github repo: https://github.com/barambolas/autoBspwm${end}"
}

if [ "$(id -u)" == "0" ]; then
	
    echo -e "\n${red}[!] Please, run the tool again with your normal user${end}"
	echo
	exit 1
else
	main
fi

