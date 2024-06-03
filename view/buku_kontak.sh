#!/bin/bash

    PHONEBOOK_FILE="daftar.txt"

    echo "------------------------------"
    echo "FITUR PENGELOLA KONTAK TELEPON"
    echo "------------------------------"
    echo "16. Tambah Kontak"
    echo "17. Menghapus Kontak"
    echo "18. Menampilkan Daftar Kontak"
    echo "------------------------------"
    read -p "Masukkan Pilihan: " menu

    case $menu in
        16)
            read -p "Masukkan nama kontak : " nama
            read -p "Masukkan nomor telepon : " nomor
            echo "$nama:$nomor" >> $PHONEBOOK_FILE
            echo "Kontak berhasil ditambahkan."
            ;;
        17)
            read -p "Masukkan nomor kontak yang ingin dihapus : " nomor
            if grep -q ":$nomor" $PHONEBOOK_FILE; then
                grep -v ":$nomor" $PHONEBOOK_FILE > temp.txt
                mv temp.txt $PHONEBOOK_FILE
                echo "Kontak berhasil dihapus!"
            else
                echo "Kontak dengan nomor HP tersebut tidak ditemukan."
            fi
            ;;
        18)
            if [ -s $PHONEBOOK_FILE ]; then
                cat $PHONEBOOK_FILE
            else
                echo "Buku telepon kosong."
            fi
            ;;
    esac