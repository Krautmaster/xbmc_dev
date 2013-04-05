umount /dev/sda1 # /dev/sda1 wird ausgehängt
clear
blue='\e[2;34m' # Blau 
NC='\e[0m' # No Color
green='\e[0;32m' # Blau
rm -rf ./script_3.sh  >> /tmp/log.log # potenziell bereits vorhandenes Script wird gelöscht, eventuelle Ausgaben in ein Log geschrieben, um den Bildschirm nicht voll zu spammen ;)
echo -e "${green}Willkommen bei Arch Linux Setup.${NC}" # Ausgabe von Text :)
echo ""
echo -e "${green}Ausgaben, die nur informieren, erscheinen in Grün, 
Ausgaben, die Auffordern, erscheinen in${blue} blau.${NC}"
loadkeys de-latin1 >> /tmp/log.log # Deutsches Tastaturlayout wird geladen, eventuelle Ausgaben in ein Log geschrieben, um den Bildschirm nicht voll zu spammen ;)
echo ""
echo ""
echo -e "${green}Zunächst wird die Festplatte partitioniert, hierfür wird die Software cfdisk verwendet.${NC}"
echo -e "${green}Diese wird mit dem Pfeiltasten bedient, dieses Script verwendet /dev/sda1 als .${NC}"
echo -e "${green}System- UND Bootpartition, also bitte bedachten.${NC}"
echo -e "${blue}Beliebige Taste drücken, um fort zu fahren.${NC}" # Weitere Textausgaben um dem User alles zu erklären :)
read -s -n 1 any_key # Script wird pausiert und bei Tastendruck fortgesetzt.
cfdisk # Partitionierungssoftware
clear # Bildschirminhalt wird geleert.
mkfs.ext4 /dev/sda1 >> /tmp/log.log # Partition wird formatiert, eventuelle Ausgaben in ein Log geschrieben, um den Bildschirm nicht voll zu spammen ;)
clear
echo -e "${green}Festplatte partitioniert und /dev/sda1 formatiert.${NC}" # Textausgaben
mount /dev/sda1 /mnt >> /tmp/log.log # Festplatte wird eingehängt, eventuelle Ausgaben in ein Log geschrieben, um den Bildschirm nicht voll zu spammen ;)
echo -e "${blue}/dev/sda1 wurde nach /mnt eingehängt.${NC}" # Textausgaben.
wget -q https://raw.github.com/Korni22/xbmc_dev/master/script_2.sh --no-check-certificate# 2. Teil des Setup-Scripts wird geladen.
mv ./script_2.sh /mnt/ # Script wird an seinen angestammten Platz verschoben.
echo -e "${blue}Basissystem wird installiert. 
Dauert je nach Internetverbindung ungefähr 5-15 Minuten.${NC}" # Textausgaben
pacstrap /mnt base{,-devel} acpid avahi dhcpcd fish git htop iproute lftp lynx mtr nano net-tools ntp openssh rsync screen subversion unrar unzip wget wireless_tools # Grundsystem wird installiert.
clear # Bildschirminhalt wird geleert.
echo -e "${blue}Basissystem wurde installiert.${NC}" # Textausgaben
genfstab -p /mnt >> /mnt/etc/fstab # Dateisystemtabelle wird generiert und geschrieben.
wget -q https://raw.github.com/Korni22/xbmc_dev/master/script_3.sh --no-check-certificate & 
echo -e "${green}Dateisystemtabelle wurde generiert.${NC}" # 3. Teil des Scripts wird geladen.
chmod 777 /mnt/script_2.sh # Rechte für das 2. Script werden gesetzt.
arch-chroot /mnt/ /script_2.sh # 2. Script wird im installierten System ausgeführt
sh ./script_3.sh # 3. Teil des Scripts wird ausgeführt.
