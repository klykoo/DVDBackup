#!/bin/bash
DVD_NAME=$(udevadm info -n dvd -q property | sed -n 's/^ID_FS_LABEL=//p')
for i in `seq 10`; do
HandBrakeCLI -i /media/freeman/$DVD_NAME/ --title $i -o ~/Vidéos/$DVD_NAME-E$i.mkv -e x265 -q 22.0 -2 -E faac -B 160 -6 dpl2 -R Auto -D 0.0 --audio-copy-mask aac,ac3,dtshd,dts,mp3 --audio-fallback ffac3 -f mkv --loose-anamorphic --modulus 2 -m --x265-preset slow --h265-profile main --all-audio --all-subtitles;
done

