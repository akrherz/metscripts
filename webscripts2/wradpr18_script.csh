#!/bin/csh 
# 14 Mar 2003	Cleanup!!!
# 21 Mar 2003	WSI products no longer exist

source ~/projects/metscripts/COMMON.csh

#
setenv DATA_DIR	/data/gempak/nexrad/NIDS/DMX/NTP
setenv LOGFILE 	www_radp
#
# Remove last hour's  www file
rm -f radp.gif* >& /dev/null
#
#
set device="GF|radp.gif"
set grid=`ls ${DATA_DIR}/NTP_${DATE}_18?? | tail -1`
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
TITLE    = 31/-2/~ RADAR EST. STORM TOTAL PRECIP THRU NOON (18Z)
#TITLE    = 1
TEXT     = 1/2/1/hw
LUTFIL   = RADAR
STNPLT   = 7|0|$GEMTBL/stns/sfmetar_sa.tbl
CLEAR    = yes
MAP      = 5/1/1 + 21/1/5 +  21/1/5
\$mapfil=hicnus.nws + hiponw.nws + mepowo.nws
list
run

exit
EOF

if (-e radp.gif) then
  cp radp.gif ${ddir2}/pix/rad/${DATE}18_storm_total_precip_thru12pm.gif
  mv radp.gif $WEBPIX//radp1.gif
  keep $WEBPIX//radp1.gif
endif
