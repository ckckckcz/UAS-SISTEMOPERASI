#!/bin/bash

# File untuk menyimpan kontak
PHONEBOOK_FILE="daftar.txt"

kembali=y
while [ $kembali == "y" ]; do
    echo "---------------------"
    echo "FITUR FILE MANAGER KW"
    echo "---------------------"
    echo "Pilih Menu File Manager KW:"
    echo "1. Lihat Lokasi Direktori"
    echo "2. Lihat Daftar File pada Folder"
    echo "3. Lihat Detail Informasi File atau Folder"
    echo "4. Lihat Isi Informasi Pada File"
    echo "5. Hapus File atau Folder"
    echo "6. Membuat File"
    echo "7. Membuat Folder"
    echo "8. Menyalin File"
    echo "9. Memindah File"
    echo "10. Kompress File"
    echo "11. Ekstrak File"
    echo "12. Mengganti Nama File"
    echo "13. Menjalankan Program"
    echo "---------------------"
    echo ""
    echo "------------------------------"
    echo "FITUR PENGELOLA KONTAK TELEPON"
    echo "------------------------------"
    echo "14. Tambah Kontak"
    echo "15. Menghapus Kontak"
    echo "16. Menampilkan Daftar Kontak"
    echo "------------------------------"
    echo ""
    echo "-----------------------------"
    echo "FITUR PENGELOLA PERNGKAT KITA"
    echo "-----------------------------"
    echo "17. Informasi CPU"
    echo "18. Informasi Baterai"
    echo "-----------------------------"
    read -p "Masukkan Pilihan: " menu

    case $menu in
        1)
            pwd
            ;;
        2)
            read -p "Masukkan nama direktori folder : " dir
            ls $dir
            ;;
        3)
            read -p "Masukkan nama direktori file : " dir
            ls -l $dir
            ;;
        4)
            read -p "Masukkan nama file : " file
            cat $file
            ;;
        5)
            read -p "Masukkan path file/folder yang ingin dihapus : " path
            rm -r $path
            ;;
        6)
            read -p "Masukkan nama file baru  : " filebaru
            touch $filebaru
            ;;
        7)
            read -p "Masukkan nama folder baru  : " folderbaru
            mkdir $folderbaru
            ;;
        8)
            read -p "Masukkan nama file yang ingin disalin : " sebelum
            read -p "Masukkan nama file yang sudah disalin : " sesudah
            cp $sebelum $sesudah
            ;;
        9)
            read -p "Masukkan nama file yang ingin dipindah   : " sebelum
            read -p "Masukkan tujuan file yang ingin dipindah : " sesudah
            mv $sebelum $sesudah
            ;;
        10) 
            read -p "Masukkan nama file atau folder yang ingin dikompres : " sebelum
            read -p "Masukkan nama file atau folder yang sudah dikompres : " sesudah 
            tar -czvf $sesudah $sebelum
            ;;
        11)
            read -p "Masukkan file yang akan diekstrak (file.zip) : " file
            tar -xzvf $file
            ;;
        12)
            read -p "Masukkan nama file yang ingin diganti : " filelama
            read -p "Masukkan nama file baru : " filebaru
            mv $filelama $filebaru
            ;;
        13)
            read -p "Masukkan nama file yang ingin dijalankan : " file
            source ./$file
            ;;
        14)
            read -p "Masukkan nama kontak : " nama
            read -p "Masukkan nomor telepon : " nomor
            echo "$nama:$nomor" >> $PHONEBOOK_FILE
            echo "Kontak berhasil ditambahkan."
            ;;
        15)
            read -p "Masukkan nomor kontak yang ingin dihapus : " nomor
            if grep -q ":$nomor" $PHONEBOOK_FILE; then
                grep -v ":$nomor" $PHONEBOOK_FILE > temp.txt
                mv temp.txt $PHONEBOOK_FILE
                echo "Kontak berhasil dihapus!"
            else
                echo "Kontak dengan nomor HP tersebut tidak ditemukan."
            fi
            ;;
        16)
            if [ -s $PHONEBOOK_FILE ]; then
                cat $PHONEBOOK_FILE
            else
                echo "Buku telepon kosong."
            fi
            ;;
        17)
            echo "Informasi CPU Anda : "
            if command -v lscpu > /dev/null; then
                lscpu
            elif [ -f /proc/cpuinfo ]; then
                cat /proc/cpuinfo
            else
                echo "Informasi CPU tidak tersedia."
            fi
            ;;
        18)
            echo "Informasi Baterai Anda :"
            if command -v acpi > /dev/null; then
                acpi -b
            else
                echo "acpi tidak tersedia."
            fi
            ;;
        *)
            echo "Pilihan tidak diketahui !"
            ;;
    esac
    read -ep $'Ingin kembali ke menu? (y/n) : ' kembali
    clear
done
