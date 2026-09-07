#!/bin/bash
set -eo pipefail

# Get pwd of the current script

. ../COMMON.sh

yy="$(date -u +%y)"
mm="$(date -u +%m)"
dd="$(date -u +%d)"
hh="$(date -u +%H)"
export TIMESTAMP="${yy}${mm}${dd}${hh}"


export DATA_DIR=/data/gempak/nexrad/NIDS/DMX/N0B
export LOGFILE=www_rad.log

device="GF|dmxRAD.gif"
file="$(find ${DATA_DIR}/ -type f -printf '%T@ %p\n' | sort -n | tail -n 1 | cut -d' ' -f2-)"
if [[ -z "$file" ]]; then
    exit 2
fi
file="$(basename "$file")"

tmp="$(echo "${file}" | cut -c 7-12)"
tmp2="$(echo "${file}" | cut -c 14-16)"
tmp3="$(echo "${file}" | cut -c 17)"
if [ "$tmp3" -gt "4" ]; then
    tmp3="5"
else
    tmp3="0"
fi

tm="${tmp}${tmp2}${tmp3}"
grid="${DATA_DIR}/${file}"


gpmap_gf << EOF > $LOGFILE
    DEVICE   = $device
    MAP      = 5/1/1
    GAREA    = dsm*
    PROJ     = rad
    SATFIL   =
    RADFIL   = ${grid}
    LATLON   = 0
    PANEL    = 0
    TITLE    = 31/-2/ DES MOINES REFLECTIVITY DATA - ${tm}
    TEXT     = 1/2/1/hw
    LUTFIL   = RADAR
    STNPLT   = 7|0|$GEMTBL/stns/sfmetar_sa.tbl
    CLEAR    = yes
    MAP	= 5/1/1 + 21/1/5
    \$mapfil=HICNUS.NWS + hipowo.cia
    list
    run

exit
EOF


cd "$CURRENT/restricted"
for num in 11 10 9 8 7 6 5 4 3 2 1 0; do
     if [[ -e "dmxRAD_${num}.gif" ]]; then
        mv -- "dmxRAD_${num}.gif" "dmxRAD_$((num + 1)).gif"
    fi
done

cd ~/projects/metscripts/dmx

cp dmxRAD.gif "$CURRENT/restricted/dmxRAD_0.gif"

cd ~/projects/metscripts/dmx

rm -f dmxRAD.gif last.nts gemglb.nts
