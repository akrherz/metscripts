#! /bin/csh 

source ~/projects/metscripts/COMMON.csh
setenv DATA_DIR	/data/gempak/mos
setenv LOGFILE 	logs/www_mosa
rm -f mosa.gif
set device="GF|mosa.gif"
set date1=`date --date '24 hours' +'%Y%m%d'`
set date2=`date --date '48 hours' +'%Y%m%d'`
set date3=`date --date '72 hours' +'%Y%m%d'`
set date4=`date --date '96 hours' +'%Y%m%d'`
set grid=${DATA_DIR}/${DATE}${1}_gmos.gem
#
#echo $grid
# Run SFMAP to generate plot of 12hrly temps,qpf,pp
#

$GEMEXE/sfmap_gf << EOF > $LOGFILE
\$RESPOND = YES
DEVICE	= $device
AREA     = 39.5;-98;45;-88
GAREA    = 39.5;-98;45;-88
SATFIL   = 
RADFIL   = 
STNPLT   =   
SFPARM   = tntf
DATTIM   = ${date1}/12
SFFILE   = $grid
COLORS   = (-20-80-10/29-7--2/tntf)
MAP      = 15/1/3
LATLON   = 0
MARKER   = 0
TITLE    = 31/-2/~  GFS MOS NIGHT TEMPERATURE
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
cp mosa.gif ${ddir}${DATE2}/pix/mos/12z/gfs_mos_${DATE}12_nighttime_temps_f24.gif
##if (-e mos_01.gif) then
  mv mosa.gif $WEBPIX/mosa_01.gif
  keep $WEBPIX/mosa_01.gif
##endif
$GEMEXE/sfmap_gf << EOF >> $LOGFILE
\$RESPOND = YES
DEVICE	= $device
AREA     = 39.5;-98;45;-88
GAREA    = 39.5;-98;45;-88
SATFIL   = 
RADFIL   = 
STNPLT   =   
SFPARM   = tdyf
DATTIM   = ${date2}/00
SFFILE   = $grid
COLORS   = (0-100-10/29-7--2/tdyf)
MAP      = 15/1/3
LATLON   = 0
MARKER   = 0
TITLE    = 31/-2/~  GFS MOS DAYTIME TEMPERATURE
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
cp mosa.gif ${ddir}${DATE2}/pix/mos/12z/gfs_mos_${DATE}12_daytime_temps_f36.gif
##if (-e mos_01.gif) then
  mv mosa.gif $WEBPIX/mosa_02.gif
  keep $WEBPIX/mosa_02.gif
##endif
$GEMEXE/sfmap_gf << EOF >> $LOGFILE
\$RESPOND = YES
DEVICE	= $device
AREA     = 39.5;-98;45;-88
GAREA    = 39.5;-98;45;-88
SATFIL   = 
RADFIL   = 
STNPLT   =   
SFPARM   = tntf
DATTIM   = ${date2}/12
SFFILE   = $grid
COLORS   = (-20-80-10/29-7--2/tntf)
MAP      = 15/1/3
LATLON   = 0
MARKER   = 0
TITLE    = 31/-2/~  GFS MOS NIGHT TEMPERATURE
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
cp mosa.gif ${ddir}${DATE2}/pix/mos/12z/gfs_mos_${DATE}12_nighttime_temps_f48.gif
##if (-e mos_01.gif) then
  mv mosa.gif $WEBPIX/mosa_03.gif
  keep $WEBPIX/mosa_03.gif
##endif
$GEMEXE/sfmap_gf << EOF >> $LOGFILE
\$RESPOND = YES
DEVICE	= $device
AREA     = 39.5;-98;45;-88
GAREA    = 39.5;-98;45;-88
SATFIL   = 
RADFIL   = 
STNPLT   =   
SFPARM   = tdyf
DATTIM   = ${date3}/00
SFFILE   = $grid
COLORS   = (0-100-10/29-7--2/tdyf)
MAP      = 15/1/3
LATLON   = 0
MARKER   = 0
TITLE    = 31/-2/~  GFS MOS DAYTIME TEMPERATURE
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
cp mosa.gif ${ddir}${DATE2}/pix/mos/12z/gfs_mos_${DATE}12_daytime_temps_f60.gif
##if (-e mos_01.gif) then
  mv mosa.gif $WEBPIX/mosa_04.gif
  keep $WEBPIX/mosa_04.gif
##endif
$GEMEXE/sfmap_gf << EOF >> $LOGFILE
\$RESPOND = YES
DEVICE	= $device
AREA     = 39.5;-98;45;-88
GAREA    = 39.5;-98;45;-88
SATFIL   = 
RADFIL   = 
STNPLT   =   
SFPARM   = tntf
DATTIM   = ${date3}/12
SFFILE   = $grid
COLORS   = (-20-80-10/29-7--2/tntf)
MAP      = 15/1/3
LATLON   = 0
MARKER   = 0
TITLE    = 31/-2/~  GFS MOS NIGHT TEMPERATURE
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
cp mosa.gif ${ddir}${DATE2}/pix/mos/12z/gfs_mos_${DATE}12_nighttime_temps_f72.gif
##if (-e mos_01.gif) then
  mv mosa.gif $WEBPIX/mosa_05.gif
  keep $WEBPIX/mosa_05.gif
##endif
$GEMEXE/sfmap_gf << EOF >> $LOGFILE
\$RESPOND = YES
DEVICE  = $device
AREA     = 39.5;-98;45;-88
GAREA    = 39.5;-98;45;-88
SATFIL   =
RADFIL   =
STNPLT   =
SFPARM   = pp12
DATTIM   = ${date1}/12
SFFILE   = $grid
COLORS   = (0-100-10/29-7--2/pp12)
MAP      = 15/1/3
LATLON   = 0
MARKER   = 0
TITLE    = 31/-2/~  GFS MOS 12hr Prob of Prec
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
cp mosa.gif ${ddir}${DATE2}/pix/mos/12z/gfs_mos_${DATE}12_12hr_pops_f24.gif
##if (-e mos_01.gif) then
  mv mosa.gif $WEBPIX/mosa_01p.gif
  keep $WEBPIX/mosa_01p.gif
##endif
$GEMEXE/sfmap_gf << EOF >> $LOGFILE
\$RESPOND = YES
DEVICE  = $device
AREA     = 39.5;-98;45;-88
GAREA    = 39.5;-98;45;-88
SATFIL   =
RADFIL   =
STNPLT   =
SFPARM   = pp12
DATTIM   = ${date2}/00
SFFILE   = $grid
COLORS   = (0-100-10/29-7--2/pp12)
MAP      = 15/1/3
LATLON   = 0
MARKER   = 0
TITLE    = 31/-2/~  GFS MOS 12hr Prob of Prec
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
cp mosa.gif ${ddir}${DATE2}/pix/mos/12z/gfs_mos_${DATE}12_12hr_pops_f36.gif
##if (-e mos_01.gif) then
  mv mosa.gif $WEBPIX/mosa_02p.gif
  keep $WEBPIX/mosa_02p.gif
##endif
$GEMEXE/sfmap_gf << EOF >> $LOGFILE
\$RESPOND = YES
DEVICE  = $device
AREA     = 39.5;-98;45;-88
GAREA    = 39.5;-98;45;-88
SATFIL   =
RADFIL   =
STNPLT   =
SFPARM   = pp12
DATTIM   = ${date2}/12
SFFILE   = $grid
COLORS   = (0-100-10/29-7--2/pp12)
MAP      = 15/1/3
LATLON   = 0
MARKER   = 0
TITLE    = 31/-2/~  GFS MOS 12hr Prob of Prec
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
cp mosa.gif ${ddir}${DATE2}/pix/mos/12z/gfs_mos_${DATE}12_12hr_pops_f48.gif
##if (-e mos_01.gif) then
  mv mosa.gif $WEBPIX/mosa_03p.gif
  keep $WEBPIX/mosa_03p.gif
##endif
$GEMEXE/sfmap_gf << EOF >> $LOGFILE
\$RESPOND = YES
DEVICE  = $device
AREA     = 39.5;-98;45;-88
GAREA    = 39.5;-98;45;-88
SATFIL   =
RADFIL   =
STNPLT   =
SFPARM   = pp12
DATTIM   = ${date3}/00
SFFILE   = $grid
COLORS   = (0-100-10/29-7--2/pp12)
MAP      = 15/1/3
LATLON   = 0
MARKER   = 0
TITLE    = 31/-2/~  GFS MOS 12hr Prob of Prec
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
cp mosa.gif ${ddir}${DATE2}/pix/mos/12z/gfs_mos_${DATE}12_12hr_pops_f60.gif
##if (-e mos_01.gif) then
  mv mosa.gif $WEBPIX/mosa_04p.gif
  keep $WEBPIX/mosa_04p.gif
##endif
$GEMEXE/sfmap_gf << EOF >> $LOGFILE
\$RESPOND = YES
DEVICE  = $device
AREA     = 39.5;-98;45;-88
GAREA    = 39.5;-98;45;-88
SATFIL   =
RADFIL   =
STNPLT   =
SFPARM   = pp12
DATTIM   = ${date3}/12
SFFILE   = $grid
COLORS   = (0-100-10/29-7--2/pp12)
MAP      = 15/1/3
LATLON   = 0
MARKER   = 0
TITLE    = 31/-2/~  GFS MOS 12hr Prob of Prec
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
cp mosa.gif ${ddir}${DATE2}/pix/mos/12z/gfs_mos_${DATE}12_12hr_pops_f72.gif
##if (-e mos_01.gif) then
  mv mosa.gif $WEBPIX/mosa_05p.gif
  keep $WEBPIX/mosa_05p.gif
##endif
$GEMEXE/sfmap_gf << EOF >> $LOGFILE
\$RESPOND = YES
DEVICE  = $device
AREA     = 39.5;-98;45;-88
GAREA    = 39.5;-98;45;-88
SATFIL   =
RADFIL   =
STNPLT   =
SFPARM   = qp12
DATTIM   = ${date1}/12
SFFILE   = $grid
COLORS   = (0-6-1/29-15--2/qp12)
MAP      = 15/1/3
LATLON   = 0
MARKER   = 0
TITLE    = 31/-2/~  GFS MOS 12hr QPF Category
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
cp mosa.gif ${ddir}${DATE2}/pix/mos/12z/gfs_mos_${DATE}12_12hr_QPF_f24.gif
##if (-e mos_01.gif) then
  mv mosa.gif $WEBPIX/mosa_01q.gif
  keep $WEBPIX/mosa_01q.gif
##endif
$GEMEXE/sfmap_gf << EOF >> $LOGFILE
\$RESPOND = YES
DEVICE  = $device
AREA     = 39.5;-98;45;-88
GAREA    = 39.5;-98;45;-88
SATFIL   =
RADFIL   =
STNPLT   =
SFPARM   = qp12
DATTIM   = ${date2}/00
SFFILE   = $grid
COLORS   = (0-6-1/29-15--2/qp12)
MAP      = 15/1/3
LATLON   = 0
MARKER   = 0
TITLE    = 31/-2/~  GFS MOS 12hr QPF Category
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
cp mosa.gif ${ddir}${DATE2}/pix/mos/12z/gfs_mos_${DATE}12_12hr_QPF_f36.gif
##if (-e mos_01.gif) then
  mv mosa.gif $WEBPIX/mosa_02q.gif
  keep $WEBPIX/mosa_02q.gif
##endif
$GEMEXE/sfmap_gf << EOF >> $LOGFILE
\$RESPOND = YES
DEVICE  = $device
AREA     = 39.5;-98;45;-88
GAREA    = 39.5;-98;45;-88
SATFIL   =
RADFIL   =
STNPLT   =
SFPARM   = qp12
DATTIM   = ${date2}/12
SFFILE   = $grid
COLORS   = (0-6-1/29-15--2/qp12)
MAP      = 15/1/3
LATLON   = 0
MARKER   = 0
TITLE    = 31/-2/~  GFS MOS 12hr QPF Category
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
cp mosa.gif ${ddir}${DATE2}/pix/mos/12z/gfs_mos_${DATE}12_12hr_QPF_f48.gif
##if (-e mos_01.gif) then
  mv mosa.gif $WEBPIX/mosa_03q.gif
  keep $WEBPIX/mosa_03q.gif
##endif
$GEMEXE/sfmap_gf << EOF >> $LOGFILE
\$RESPOND = YES
DEVICE  = $device
AREA     = 39.5;-98;45;-88
GAREA    = 39.5;-98;45;-88
SATFIL   =
RADFIL   =
STNPLT   =
SFPARM   = qp12
DATTIM   = ${date3}/00
SFFILE   = $grid
COLORS   = (0-6-1/29-15--2/qp12)
MAP      = 15/1/3
LATLON   = 0
MARKER   = 0
TITLE    = 31/-2/~  GFS MOS 12hr QPF Category
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
cp mosa.gif ${ddir}${DATE2}/pix/mos/12z/gfs_mos_${DATE}12_12hr_QPF_f60.gif
##if (-e mos_01.gif) then
  mv mosa.gif $WEBPIX/mosa_04q.gif
  keep $WEBPIX/mosa_04q.gif
##endif
$GEMEXE/sfmap_gf << EOF >> $LOGFILE
\$RESPOND = YES
DEVICE  = $device
AREA     = 39.5;-98;45;-88
GAREA    = 39.5;-98;45;-88
SATFIL   =
RADFIL   =
STNPLT   =
SFPARM   = qp12
DATTIM   = ${date3}/12
SFFILE   = $grid
COLORS   = (0-6-1/29-15--2/qp12)
MAP      = 15/1/3
LATLON   = 0
MARKER   = 0
TITLE    = 31/-2/~  GFS MOS 12hr QPF Category
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
cp mosa.gif ${ddir}${DATE2}/pix/mos/12z/gfs_mos_${DATE}12_12hr_QPF_f72.gif
##if (-e mos_01.gif) then
  mv mosa.gif $WEBPIX/mosa_05q.gif
  keep $WEBPIX/mosa_05q.gif
##endif
