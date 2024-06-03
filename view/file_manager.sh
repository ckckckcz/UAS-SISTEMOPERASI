#!/bin/bash

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
    echo "14. Mengunci File"
    echo "15. Membuka File"
    echo "---------------------"
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
            read -p "Masukkan nama file yang ingin dikunci : " file
            read -sp "Masukkan kata sandi untuk mengunci file : " password
            echo ""
            zip -P $password $file.zip $file
            echo "File berhasil dikunci dengan kata sandi."
            ;;
        15)
            read -p "Masukkan nama file yang ingin diekstrak : " file
            read -sp "Masukkan kata sandi untuk membuka file : " password
            echo ""
            
            if [ -f "$file" ]; then
                if unzip -t -P "$password" "$file" 2>/dev/null; then
                    unzip -P "$password" "$file"
                    echo "File berhasil diekstrak."
                else
                    echo "Kata sandi salah atau file tidak dapat diekstrak."
                fi
            else
                echo "Kata Sandi Salah."
            fi
            ;;
    esac