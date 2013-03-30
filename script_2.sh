echo LANG=de_DE.UTF-8 >> /etc/locale.conf # Sprache fürs System wird gesetzt.
echo LC_COLLATE=C >> /etc/locale.conf
echo KEYMAP=de-latin1 > /etc/vconsole.conf # Tastaturlayout wird gesetzt.
echo kundenserver > /etc/hostname # Hostname wird auf kundenserver gesetzt.
ln /usr/share/zoneinfo/Europe/Berlin /etc/localtime >> /tmp/log.log # Zeitzone wird gesetzt, Ausgabe wird in ein Log geschrieben.
blue='\e[2;34m' # Blau
NC='\e[0m' # No Color
green='\e[0;32m' # Blau
echo -e "${green}Sprache wurde gesetzt.${NC}" # Textausgabe.
cd /tmp/ # Ordner wird nach /tmp gewechselt.
wget -q https://raw.github.com/Korni22/prepared-configs/master/mirrorlist
wget -q https://raw.github.com/Korni22/prepared-configs/master/locale.gen # Dateien werden geladen
mv ./locale.gen /etc/locale.gen
mv ./mirrorlist /etc/pacman.d/mirrorlist # Diese werden installiert.
locale-gen >> /tmp/log.log # Sprachen werden generiert, Ausgabe in ein Log geschrieben.
echo -e "${green}Sprachdateien wurden generiert.${NC}" # Textausgabe.
mkinitcpio -p linux >> /tmp/log.log # Kernel wird generiert.
clear # Bildschirminhalt wird geleert.
echo -e "${green}Kernel wurde generiert" # Textausgabe.
echo -e "${blue}Bitte jetzt gewünschtes root-Passwort eingeben!${NC}" # Textausgabe.
passwd # Passwort wird geändert.
fish exit