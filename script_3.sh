black='\e[0;30m' # Schwarz
pacstrap /mnt syslinux
syslinux-install_update -i -a -m -c /mnt
blue='\e[2;34m' # Blau
NC='\e[0m' # No Color
green='\e[0;32m' # Blau
echo -e "${green}Bootloader wurde installiert${NC}"
wget -q https://raw.github.com/Korni22/xbmc_dev/master/postinstall.sh
mv ./postinstall.sh /mnt/root & 
wget -q https://raw.github.com/Korni22/prepared-configs/master/syslinux.cfg
mv ./syslinux.cfg /mnt/boot/syslinux/syslinux.cfg
clear
echo -e "${green}Bootloader wurde konfiguriert${NC}"
umount /mnt
echo -e "${green}System ist einsatzbereit!${NC}"
echo -e "${blue}Soll der Rechner neu gestartet werden?${NC}"
select jn in "Ja" "Nein"; do
    case $jn in
        Ja ) reboot; break;;
        Nein ) exit;;
    esac
done
