            #!/bin/bash

            read -p "Masukkan Username yang ingin anda kunci: " username
            egrep "^$username" /etc/passwd >/dev/null
            if [ $? -eq 0 ]; then
            # proses mengganti passwordnya
            passwd -l $username
            echo""
            echo "Script by overses.net"
            echo "Terimakasih sudah berlangganan di overses.net"
            echo " "
            echo "-----------------------------------------------"
            echo -e "Username ${blue}$username${NC} Sudah berhasil di ${red}KUNCI${NC}."
            echo -e "Akses Login untuk username ${blue}$username${NC} sudah kunci"
            echo "-----------------------------------------------"
            else
            echo "Username tidak ditemukan di server anda"
            exit 1
            fi
