#!/bin/bash

# Lokasi direktori musik


#!/bin/bash

# Pastikan file MP3 disediakan
if [[ -z "$1" ]]; then
    echo "Penggunaan: $0 <Music.mp3>"
    exit 1
fi

FILE="$1"

# Periksa apakah file ada
if [[ ! -f "$Music" ]]; then
    echo "Music $Music tidak ditemukan."
    exit 1
fi

# Mainkan file dengan mpv dan volume tinggi
echo "Memutar $FILE dengan volume maksimum!"
mpv --volume=999999999999999999 "$FILE"
