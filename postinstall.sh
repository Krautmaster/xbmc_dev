ethernet=`ls /sys/class/net | grep en`
ip link set $ethernet down
ifrename -i $ethernet -n eth0 >> /tmp/log.log
dhcpcd eth0 >> /tmp/log.log
blue='\e[2;34m' # Blau
NC='\e[0m' # No Color
green='\e[0;32m' # Blau
clear
echo -e "${green}Netzwerk funktioniert jetzt.${NC}"
systemctl enable dhcpcd
systemctl enable sshd
echo -e "${green}Alle notwendigen Dienste starten jetzt mit dem System mit.${NC}"
chsh -s /usr/bin/fish
wget -q https://raw.github.com/Korni22/archlinux_kundenserver/master/Configs/config.fish
wget -q https://raw.github.com/Korni22/archlinux_kundenserver/master/Configs/fish_prompt.fish
wget -q https://raw.github.com/Korni22/prepared-configs/master/mirrorlist
echo -e "${green}Konfigurationsdateien wurden geladen.${NC}"
mv /root/config.fish /root/.config/fish/
mv /root/fish_prompt.fish /root/.config/fish/
mv /root/mirrorlist /etc/pacman.d/mirrorlist
clear
echo -e "${blue}Konfigurationsdateien wurden eingespielt.${NC}"
echo -e "${blue}Bei beliebigem Tastendruck wird neugestartet.${NC}"
read -s -n 1 any_key
rm -rf ./postinstall.sh
rm -rf /script_2.sh
reboot