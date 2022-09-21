source ../COMMON.csh

setenv DATA_DIR	/data/gempak/nldn
setenv LOGFILE 	logs/www_ltg.log

set device="gf|ltg.gif"
set grid=/data/gempak/nldn/${DATE}${hh}00_nldn.gem

$GEMEXE/sfmap_gf << EOF > $LOGFILE
\$RESPOND = YES
DEVICE	= $device 
AREA     = 38;-101;45;-89
GAREA    = 38;-101;45;-89
SATFIL   = 
RADFIL   = 
SFPARM   = MARK:15:2:3
DATTIM   = LAST
SFFILE   = $grid
COLORS   = 2
MAP      = 3/1/1
LATLON   = 0
MARKER   = 2/15/1/5/hw
TITLE    = 31/-2/ LIGHTNING STRIKES IN LAST HOUR (Beginning ~)
CLEAR    = yes
PANEL    = 0
PROJ     = lcc
FILTER   = no
TEXT     = 0.73/2/1/hw
SKPMIS   = NO
LUTFIL   = default
STNPLT   = 5|0|$GEMTBL/stns/sfmetar_sa.tbl
MAP	= 3/1/1 + 3/1/4 + 3/1/4
\$mapfil=hicnus.nws + hipowo.nws + hipowo.cia
list
run

EOF

#
# Run GPEND to clean up
#
# $GEMEXE/gpend
#
# Rename ps file to indicate ltg data
if (-e ltg.gif) then
  mkdir -p ${ddir}${DATE2}/pix/ltg/Midwest_lightning_past_hour
  cp ltg.gif ${ddir}${DATE2}/pix/ltg/Midwest_lightning_past_hour/${DATE}${hh}_Midwest_lightning.gif
  mv ltg.gif $WEBPIX/restricted/ltg.gif
  keep $WEBPIX/restricted/ltg.gif
endif
