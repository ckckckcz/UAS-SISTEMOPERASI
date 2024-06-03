#!/bin/bash

kembali=y
while [ $kembali == "y" ]; do
    clear
    echo "Menu Utama:"
    echo "1. File Manager KW"
    echo "2. Pengelola Kontak Telepon"
    echo "3. Pengelola Perangkat Kita"
    read -p "Masukkan Pilihan: " menu

    case $menu in
        1)
            source ./view/file_manager.sh
            ;;
        2)
            source ./view/buku_kontak.sh
            ;;
        3)
            source ./view/perangkat_manager.sh
            ;;
        *)
            echo "Pilihan tidak diketahui!"
            ;;
    esac

    read -ep $'Ingin kembali ke menu? (y/n) : ' kembali
done
