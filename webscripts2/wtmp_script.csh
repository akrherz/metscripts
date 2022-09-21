source ../COMMON.csh
setenv DATA_DIR	$SAO
setenv LOGFILE 	logs/www_tmp.log

set device="gf"
set grid=${DATA_DIR}/${DATE}${1}_sao.gem
#
# Run SFMAP to generate plot of 6 am temps
#
$GEMEXE/sfmap_gf << EOF > $LOGFILE
\$RESPOND = YES
DEVICE	= GF|tmp_01.gif|720;540
AREA     = 20;-128;53;-54
GAREA    = 20;-116;51;-62
SATFIL   = 
RADFIL   = 
STNPLT   =   
SFPARM   = tmpf
DATTIM   = ${date}/12
SFFILE   = $grid
COLORS   = 5
MAP      = 15/1/3
LATLON   = 0
MARKER   = 0
TITLE    = 31/-2/~  6 AM SURFACE TEMPERATURE
CLEAR    = yes
PANEL    = 0
PROJ     = lcc
FILTER   = 0.8
TEXT     = 0.70/2/1/hw
SKPMIS   = NO
list
run


exit
EOF

#
# Run GPEND to clean up
#
#$GEMEXE/gpend
#
# Rename ps file to indicate sfc data
if (-e tmp_01.gif) then
  cp tmp_01.gif ${ddir2}/pix/tmp/${DATE}_6AM_sfc_temps.gif
  mv tmp_01.gif $WEBPIX//tmp_01.gif
  keep $WEBPIX//tmp_01.gif
endif

$GEMEXE/sfmap_gf << EOF >> $LOGFILE
\$RESPOND = YES
DEVICE	= GF|tmp_02.gif|720;540
AREA     = dset
SATFIL   = 
RADFIL   = 
STNPLT   =  
SFPARM   = p24i
DATTIM   = ${date}/12
SFFILE   = $grid
COLORS   = 5 
MAP      = 15/1/2
LATLON   = 0
MARKER   = 0
TITLE    = 31/-2/~  24 HR PRECIPITATION (INCHES)
CLEAR    = yes
PANEL    = 0
PROJ     = lcc
FILTER   = 0.55
TEXT     = 0.70/2/1/hw
SKPMIS   = NO
list
run


exit
EOF

#
# Run GPEND to clean up
#
#$GEMEXE/gpend
#
# Rename ps file to indicate sfc data
if (-e tmp_02.gif) then
cp tmp_02.gif ${ddir2}/pix/tmp/${DATE}_24hr_precip.gif  
mv tmp_02.gif $WEBPIX//tmp_02.gif
keep $WEBPIX//tmp_02.gif
endif
