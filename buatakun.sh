#!/bin/bash
# Created by http://www.overses.net
1
echo""

read -p "Masukkan Username : " username
egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
echo "Username sudah ada di VPS anda"
exit 0
else
read -p "Masukkan Password [$username]: " password
read -p "Masa Aktif Account [$username] (Hari): " masa_aktif
MYIP=$(wget -qO- ipv4.icanhazip.com)
today=`date +%s`
masa_aktif_detik=$(( $masa_aktif * 86400 ))
saat_expired=$(($today + $masa_aktif_detik))
tanggal_expired=$(date -u --date="1970-01-01 $saat_expired sec GMT" +%Y/%m/%d)
tanggal_expired_display=$(date -u --date="1970-01-01 $saat_expired sec GMT" '+%d %B %Y')


useradd $username
usermod -s /bin/false $username
usermod -e  $tanggal_expired $username
  egrep "^$username" /etc/passwd >/dev/null
  echo -e "$password\n$password" | passwd $username
  echo "Script by overses.net"
  echo "Terimakasih sudah berlangganan di @orangkuatsabahanterkini"
  echo " "
  echo "Demikian Detail Account Yang Telah Dibuat"
  echo "---------------------------------------"
  echo "Host            : $MYIP"
  echo "Username        : $username"
  echo "Password        : $password"
  echo "Masa aktif      : $masa_aktif Hari"
  echo "Tanggal Expired : $tanggal_expired_display"
  echo "Dropbear Port   : 80, 109, 110, 443"
  echo "OpenSSH Por     : 22 , 143"
  echo "Squid Proxy     : 8080, 8000, 3128"
  echo "OpenVPN Config  : http://$MYIP:81/client.ovpn"
  echo "--------------------------------------"
fi
