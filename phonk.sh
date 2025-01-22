#!/bin/bash

# Lokasi direktori musik
MUSIC_DIR="Music"

# Periksa apakah direktori musik ada
if [[ ! -d "$MUSIC_DIR" ]]; then
    echo "Direktori musik tidak ditemukan di $MUSIC_DIR."
    exit 1
fi

# Tampilkan daftar musik
echo "=== Jarvis Music Player ==="
echo "Daftar Musik di $MUSIC_DIR:"
files=("$MUSIC_DIR"/*.mp3)
for i in "${!files[@]}"; do
    printf "%d) %s\n" $((i + 1)) "$(basename "${files[$i]}")"
done

# Minta pengguna memilih musik
echo "Pilih nomor musik (1-${#files[@]}) atau ketik 0 untuk keluar:"
read -r choice

# Validasi input
if [[ "$choice" -eq 0 ]]; then
    echo "Keluar dari Jarvis Music Player."
    exit 0
elif [[ "$choice" -ge 1 && "$choice" -le "${#files[@]}" ]]; then
    echo "Memutar: $(basename "${files[$choice - 1]}")"
    mpv "${files[$choice - 1]}"
else
    echo "Pilihan tidak valid. Keluar."
    exit 1
fi
