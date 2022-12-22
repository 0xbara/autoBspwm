# Enviroment

![screenshot](https://github.com/barambolas/autoBspwm/blob/main/files/Screenshot%20at%202022-12-20%2018-40-07.png?raw=true)
# Installation 

```
git clone https://github.com/barambolas/autoBspwm.git

cd autoBspwm

chmod +x autoBspwm.sh

./autoBspwm.sh
```

# Enviroment Hotkeys
### Independent

<kbd>❖</kbd> + <kbd>Enter</kbd> : Open terminal (kitty).    
<kbd>❖</kbd> + <kbd>1,2,3,4...</kbd> : Focus to the given desktop.    
<kbd>❖</kbd> + <kbd>Shift</kbd> + <kbd>1,2,3,4...</kbd> : Send to the given desktop.    
<kbd>❖</kbd> + <kbd>D</kbd> : Program launcher.    
<kbd>❖</kbd> + <kbd>ESC</kbd> : Make sxhkd reload its configuration files.    

### Bspwm

<kbd>❖</kbd> + <kbd>Alt</kbd> + <kbd>(q,r)</kbd> : Quit or Restart bspwm.    
<kbd>❖</kbd> + <kbd>W</kbd> : Close and Kill.    
<kbd>❖</kbd> + <kbd>M</kbd> : Alternate between the Tiled and Monocle layout    
<kbd>❖</kbd> + <kbd>Y</kbd> : Send the newest marked Node to the newest preselected Node.    
<kbd>❖</kbd> + <kbd>G</kbd> : Swap the current Node and the biggest window.    

### Preselect

<kbd>❖</kbd> + <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>(🠐 🠑 🠒 🠓)</kbd> : Preselect the direction.    
<kbd>❖</kbd>s + <kbd>Ctrl</kbd> + <kbd>(1-9)</kbd> : Preselect the ratio.    
<kbd>❖</kbd> + <kbd>Ctrl</kbd> + <kbd>Space</kbd> : Cancel the preselection for the focused Node.    
<kbd>❖</kbd> + <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Space</kbd> : Cancel the preselection for the focused desktop.    

### Move/Resize

<kbd>❖</kbd> + <kbd>Ctrl</kbd> + <kbd>(🠐 🠑 🠒 🠓)</kbd> : Move a floating window.    
<kbd>❖</kbd> + <kbd>Alt</kbd> + <kbd>(🠐 🠑 🠒 🠓)</kbd> : Custom a move/resize.    

### Custom Launchers App

<kbd>❖</kbd> + <kbd>Shift</kbd> + <kbd>F</kbd> : Firefox.    
<kbd>❖</kbd> + <kbd>Shift</kbd> + <kbd>B</kbd> : Burpsuite.    

# Terminal Hotkeys

<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>Enter</kbd> : Open Terminal window.    
<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>W</kbd> : Close Terminal window.    
<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>L</kbd> : Change window disposition.    
<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>T</kbd> : Open terminal tab.    
<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>(🠐 🠑 🠒 🠓)</kbd> : Change Terminal tab.    
<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>Alt</kbd> + <kbd>T</kbd> : Change tab name.    
<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>(, or .)</kbd> : Change tab order.    
<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>R</kbd> : Resize window.    
<kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Left Click</kbd> : Select text.    
<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>U</kbd> : Open hex help.    
<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>E</kbd> : Look for URL's.
<kbd>Ctrl</kbd> + <kbd>L</kbd> : Clean Terminal window.

# Guide

### Target IP

```
  settarget (TARGET IP)
```
```
  cleartarget
```

### Ethernet Status

Config File: **/home/$USER/.config/bin/ethernet_status.sh**    
Change **eth0** to your own ethernet status name.

Use command `ifconfig` if you don't know your ethernet name.

### Modify Enviroment Hotkeys

Config File: /home/$USER/.config/sxhkd/sxhkdrc

### Terminal

Config File: **/home/$USER/.config/kitty/kitty.conf**    
For more information [Click Here](https://sw.kovidgoyal.net/kitty/conf/).

### Powerlevel 10k

If you have this error:
```
zsh compinit: insecure files, run compaudit for list.
Ignore insecure files and continue [y] or abort compinit [n]?

Type: Y
```
Execute the following lines:    
`compaudit` And it will give you a list of directories it thinks are unsecure.    
`sudo chown -R  $USER:root target_directory`    
`sudo chmod -R 755 target_directory`    
    
Config User File: **/home/$USER/.p10k.zsh**    
Config Root File: **/root/.p10k.zsh**
