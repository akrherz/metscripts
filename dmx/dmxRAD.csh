#!/bin/csh 

source ../COMMON.csh
set yy=`date -u +%y`
set YY=`date -u +%Y`
set mm=`date -u +%m`
set dd=`date -u +%d`
set date=${yy}${mm}${dd}
set hh=`date -u +%H`
set bigdate=`date -u +%Y.%m.%d\ %HZ`
setenv ARCHIVE $ARCHIVE/${YY}_${mm}_${dd}/
setenv TIMESTAMP ${yy}${mm}${dd}${hh}


setenv DATA_DIR	/data/gempak/nexrad/NIDS/DMX/N0B
setenv LOGFILE 	www_rad.log

set device="GF|dmxRAD.gif"
set file=`ls -1t ${DATA_DIR}/ | head -1`
if ($file == '') then
  exit
endif

set tmp="`echo ${file} | cut -c 7-12`"
set tmp2="`echo ${file} | cut -c 14-16`"
set tmp3="`echo ${file} | cut -c 17`"
if ( $tmp3 > "4" ) then
    set tmp3 = "5"
else
    set tmp3 = "0"
endif

set tm=${tmp}${tmp2}${tmp3}
set grid=${DATA_DIR}/${file}


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


cd $CURRENT/restricted
foreach num (11 10 9 8 7 6 5 4 3 2 1 0)
    mv dmxRAD_${num}.gif dmxRAD_`echo ${num} + 1 | bc`.gif
end

cd ~/projects/metscripts/dmx

cp dmxRAD.gif $CURRENT/restricted/dmxRAD_0.gif

if ( $1 == 'save') then
        cp dmxRAD.gif ${ARCHIVE}/DMX${TIMESTAMP}.gif
endif

cd ~/projects/metscripts/dmx

rm -f dmxRAD.gif last.nts gemglb.nts
