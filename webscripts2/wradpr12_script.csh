#!/bin/csh 
# 21 Mar 2003	Cleanup and not use WSI products
#
source ~/projects/metscripts/COMMON.csh
setenv DATA_DIR	/data/gempak/nexrad/NIDS/DMX/NTP
setenv LOGFILE 	www_radp12
rm -f radp.gif* >& /dev/null
set device="GF|radp.gif"
set grid=`ls ${DATA_DIR}/NTP_${DATE}_12?? | tail -1`

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
LATLON   = 0
PANEL    = 0 
TITLE    = 31/-2/~ RADAR EST. STORM TOTAL PRECIP THRU 6AM (12Z)
#TITLE    = 1
TEXT     = 1/2/1/hw
LUTFIL   = RADAR
STNPLT   = 7|0|$GEMTBL/stns/sfmetar_sa.tbl
CLEAR    = yes
MAP      = 5/1/1    + 21/1/5     + 21/1/5
\$mapfil=hicnus.nws + hiponw.nws + mepowo.nws
list
run

exit
EOF

if (-e radp.gif) then
  cp radp.gif ${ddir2}/pix/rad/${DATE}12_storm_total_precip_thru6am.gif
  mv radp.gif $WEBPIX//radp.gif
  keep $WEBPIX//radp.gif
endif
