#!/bin/bash    
    echo "-----------------------------"
    echo "FITUR PENGELOLA PERNGKAT KITA"
    echo "-----------------------------"
    echo "19. Informasi CPU"
    echo "20. Informasi Baterai"
    echo "21. Informasi Jam Sekarang"
    echo "22. Informasi Kecepatan Wifi"
    echo "-----------------------------"
    read -p "Masukkan Pilihan: " menu

    case $menu in
        19)
            echo "Informasi CPU Anda : "
            if command -v lscpu > /dev/null; then
                lscpu
            elif [ -f /proc/cpuinfo ]; then
                cat /proc/cpuinfo
            else
                echo "Informasi CPU tidak tersedia."
            fi
            ;;
        20)
            echo "Informasi Baterai Anda :"
            if command -v acpi > /dev/null; then
                acpi -b
            else
                echo "acpi tidak tersedia."
            fi
            ;;
        21)
            current_time=$(date "+%Y-%m-%d %H:%M:%S")
            echo "Waktu saat ini adalah: $current_time"
            ;;
        22) 
            timestamp=$(date "+%Y-%m-%d %H:%M:%S")

            hasil=$(speedtest-cli --simple)

            if [ $? -eq 0 ]; then
                echo "$timestamp - Speedtest Sukses"
                echo "$hasil"
                echo "$timestamp - $hasil" >> speedtest.log
            else
                echo "$timestamp - Speedtest Gagal" >&2
                echo "$timestamp - Speedtest Gagal" >> speedtest.log
            fi
            ;;
        *)
            echo "Pilihan tidak diketahui !"
            ;;
    esac