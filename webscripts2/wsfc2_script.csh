#!/bin/csh 

source ~/projects/metscripts/COMMON.csh

setenv LOGFILE 	logs/www_sfc2
set grid=/data/gempak/surface/sao/${DATE}${1}_sao.gem

$GEMEXE/sfmap_gf << EOF > $LOGFILE
\$RESPOND = YES
DEVICE	= GF|sfc2_01.gif|964;624
AREA     = 20;-128;53;-54
GAREA    = 20;-116;51;-62
SATFIL   = 
RADFIL   = 
STNPLT  =  
SFPARM   = skyc:0.65;tmpf;wsym:0.65;rmsl;;dwpf;brbk:0.65
DATTIM   = ${date}/${hh}00
SFFILE   = $grid
COLORS   = 31;5;5;6;3;31
MAP      = 15/1/3
LATLON   = 0
MARKER   = 0
TITLE    = 31/-2/~  SURFACE DATA
CLEAR    = yes
PANEL    = 0
PROJ     = lcc
FILTER   = 0.8
TEXT     = 0.66/2/1/hw
SKPMIS   = NO
\$mapfil = 
list
run

exit
EOF

if (-e sfc2_01.gif) then
  cp sfc2_01.gif ${ddir}${DATE2}/pix/sfc/sfc_obs/${DATE}${hh}_sfc_obs.gif
  mv sfc2_01.gif $WEBPIX/sfc2_01.gif
  keep $WEBPIX/sfc2_01.gif
endif
