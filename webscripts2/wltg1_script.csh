source ../COMMON.csh
setenv LOGFILE 	logs/www_ltg1.log

set device="gf|ltg1.gif"
set grid=/data/gempak/nldn/${DATE}${hh}00_nldn.gem

$GEMEXE/sfmap_gf << EOF > $LOGFILE
\$RESPOND = YES
DEVICE	= $device 
\$mapfil = 
AREA     = 19;-122;53;-60
GAREA    = 19;-122;53;-60
SATFIL   = 
RADFIL   = 
SFPARM   = MARK:15:2:3
DATTIM   = ${date}/${hh}
SFFILE   = $grid
COLORS   = 2
MAP      = 3/1/1
LATLON   = 0
MARKER   = 2/15/1/3/hw
TITLE    = 31/-2/~  LIGHTNING STRIKES IN LAST HOUR
CLEAR    = yes
PANEL    = 0
PROJ     = lcc/25;-95;25
FILTER   = no
TEXT     = 0.73/2/1/hw
SKPMIS   = NO
LUTFIL   = default
STNPLT   = 
list
run

exit
EOF

#

if (-e ltg1.gif) then
  mkdir -p ${ddir}${DATE2}/pix/ltg/US_lightning_past_hour/
  cp ltg1.gif ${ddir}${DATE2}/pix/ltg/US_lightning_past_hour/US_lightning_${hh}z.gif
  mv ltg1.gif $WEBPIX/restricted/ltgusa.gif
  keep $WEBPIX/restricted/ltgusa.gif
endif
