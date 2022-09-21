
source ../COMMON.csh
setenv DATA_DIR	/data/gempak/nexrad/NIDS/DMX/NTP
setenv LOGFILE 	logs/www_raddp00.log

set device="GF|radp.gif"
set grid=`ls ${DATA_DIR}/NTP_${DATE}_00?? | tail -1`

#
# Run GPMAP to generate radar plot
#
$GEMEXE/gpmap_gf << EOF > $LOGFILE
\$RESPOND = YES
DEVICE   = $device
GAREA    = dsm*
PROJ     = rad
SATFIL   = 
RADFIL   = ${grid}
#RADFIL   = /mnt/zdata/nexrad/PRETX/00/9706130005.DMX
LATLON   = 0
PANEL    = 0 
TITLE    = 31/-2/~ RADAR EST. STORM TOTAL PRECIP THRU 6PM (00Z)
#TITLE    = 1
TEXT     = 1/2/1/hw
LUTFIL   = RADAR
STNPLT   = 7|0|$GEMTBL/stns/sfmetar_sa.tbl
CLEAR    = yes
\$mapfil=hicnus.nws + hiponw.nws + mepowo.nws
MAP      = 5/1/1 +  21/1/5 + 21/1/5
list
run

exit
EOF

# Rename ps file to indicate sfc data
if (-e radp.gif) then
cp radp.gif ${ddir2}/pix/rad/${DATE}00_storm_total_precip_thru6pm.gif
mv radp.gif $WEBPIX//radp0.gif
keep $WEBPIX//radp0.gif
endif
