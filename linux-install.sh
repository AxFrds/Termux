#!/bin/bash
g="\033[0;32m"
r="\033[1;31m"
n="\033[0m"

Main(){
clear
echo -e "${g}[1] ${n}Alpine Linux"
echo -e "${g}[2] ${n}Arch Linux"
echo -e "${g}[3] ${n}Debian"
echo -e "${g}[4] ${n}Fedora"
echo -e "${g}[5] ${n}Manjaro (aarch64)"
echo -e "${g}[6] ${n}OpenSUSE"
echo -e "${g}[7] ${n}Ubuntu"
echo -e "${g}[8] ${n}Void Linux"
echo -e "${g}[x] ${n}Cancel"
read -p $'\n[ Select distro ] > \033[0;32m' opt
printf "${n}"

if [[ $opt == 1 ]]; then
	os="alpine"

elif [[ $opt == 2 ]]; then
	os="archlinux"

elif [[ $opt == 3 ]]; then
	os="debian"

elif [[ $opt == 4 ]]; then
	os="fedora"

elif [[ $opt == 5 ]]; then
	os="manjaro-aarch64"

elif [[ $opt == 6 ]]; then
	os="opensuse"

elif [[ $opt == 7 ]]; then
	os="ubuntu"

elif [[ $opt == 8 ]]; then
	os="void"

elif [[ $opt == x ]]; then
	echo "Canceled"
	exit 1

else
	echo -e "${r}Failed option!"
	sleep 2
	Main

fi

pkg update -y
pkg upgrade -y
pkg install proot-distro -y
proot-distro install $os
echo "proot-distro login $os" > $PREFIX/bin/$os
chmod +x $PREFIX/bin/$os
}

Main
