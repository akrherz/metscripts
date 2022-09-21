source ../COMMON.csh
setenv LOGFILE 	logs/www_theta.log

set device="GF|theta.gif"
set grid=${MODEL}/nam/${DATE}${1}_nam212.gem
set grid1=tht1.grd

$GEMEXE/gdvint << EOF > $LOGFILE
\$RESPOND = YES
GDFILE = $grid
GDOUTF = $grid1
GDATTIM = f12
GVCORD  = pres/thta
GLEVEL  =  280-310-10
MAXGRD  =  800
GAREA  =  grid
VCOORD =  pres
list
run


exit
EOF
$GEMEXE/gdvint << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE = $grid
GDOUTF = $grid1
GDATTIM = f24
GVCORD  = pres/thta
GLEVEL  =  280-310-10
MAXGRD  =  800
GAREA  =  grid
VCOORD =  pres
list
run


exit
EOF
$GEMEXE/gdvint << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE = $grid
GDOUTF = $grid1
GDATTIM = f36
GVCORD  = pres/thta
GLEVEL  =  280-310-10
MAXGRD  =  800
GAREA  =  grid
VCOORD =  pres
list
run


exit
EOF
$GEMEXE/gdvint << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE = $grid
GDOUTF = $grid1
GDATTIM = f48
GVCORD  = pres/thta
GLEVEL  =  280-310-10
MAXGRD  =  800
GAREA  =  grid
VCOORD =  pres
list
run


exit
EOF
gpend

##GAREA   = 17;-122;53;-60
# Run GDPLOT and generate ETA isentropic gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid1
GDATTIM	= f12-f48-12
DEVICE	= $device 
PANEL	= 0
TEXT	= 1.2/21//hw
CONTUR	= 1
MAP     = 31/1/1
CLEAR	= yes
CLRBAR  = 31

GAREA   = 23;-108;51;-65
PROJ	= lcc/25;-95;25
LATLON	= 0

GLEVEL	= 290 ! 290 ! 290
GVCORD	= thta ! thta ! thta
GFUNC	= relh@290%thta ! pres@290%thta ! mixr@290%thta 
SCALE	= 999        ! 999 ! 999
CINT	= ! 30        ! 1;2;3;4;5;6;8;10;12;14;16;18   
LINE	= ! 2/1/2    !   32/5/2    
GVECT	=  wnd
WIND  =   bk32//3
TITLE	= ! 5/-2/ ~ ETA 290K PRES(RED), MIXR(BLACK), RH(color)
SKIP	=  /2;2 ! /2;2
FINT	= 20 ! !
FLINE	= 20;18-17--1;21-24 !  ! 
CTYPE	= f ! c ! c
HLSYM   = 
HILO    = ! ! 
STNPLT  = 0 ! 0 ! 0
\$mapfil=hipowo.gsf
list
run


exit
EOF
#
# Run GPEND to clean up
#
#$GEMEXE/gpend

# Copy ps.plt to different name for eta model

cp theta.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_290K_theta_mixr_RH_f12.gif
cp theta.gif.001 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_290K_theta_mixr_RH_f24.gif
cp theta.gif.002 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_290K_theta_mixr_RH_f36.gif
cp theta.gif.003 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_290K_theta_mixr_RH_f48.gif


mv theta.gif $WEBPIX//theta_01.gif
mv theta.gif.001 $WEBPIX//theta_02.gif
mv theta.gif.002 $WEBPIX//theta_03.gif
mv theta.gif.003 $WEBPIX//theta_04.gif
#keep $WEBPIX//theta_0[1-4].gif
#
# Run GDPLOT and generate ETA model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid1
GDATTIM	= f12-f48-12
DEVICE	= $device 
PANEL	= 0
TEXT	= 1.2/21//hw
CONTUR	= 1
MAP     = 31/1/1
CLEAR	= yes
CLRBAR  = 31

GAREA   = 23;-108;51;-65
PROJ	= lcc/25;-95;25
LATLON	= 0

GLEVEL	= 300 ! 300 ! 300
GVCORD	= thta ! thta !thta
GFUNC	= relh@300%thta ! pres@300%thta ! mixr@300%thta 
SCALE	= 999        ! 999 ! 999
CINT	= ! 30        ! 1;2;3;4;5;6;8;10;12;14;16;18 
LINE	= ! 2/1/2    !   32/5/2 
GVECT	= wnd
WIND  =   bk32//3
TITLE	= ! 5/-2/ ~ ETA 300K PRES(RED), MIXR(BLACK), RH(color)
SKIP	= /2;2 ! /2;2
FINT	= 20 ! ! 
FLINE	= 20;18-17--1;21-24 ! !
CTYPE	= f ! c ! c
HLSYM   = 
HILO    = ! ! 
STNPLT  = 0!0! 0
\$mapfil=hipowo.gsf
list
run

exit
EOF
#
# Run GPEND to clean up
#
#$GEMEXE/gpend

# Copy ps.plt to different name for eta model

cp theta.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_300K_theta_mixr_RH_f12.gif
cp theta.gif.001 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_300K_theta_mixr_RH_f24.gif
cp theta.gif.002 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_300K_theta_mixr_RH_f36.gif
cp theta.gif.003 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_300K_theta_mixr_RH_f48.gif


mv theta.gif $WEBPIX//theta_05.gif
mv theta.gif.001 $WEBPIX//theta_06.gif
mv theta.gif.002 $WEBPIX//theta_07.gif
mv theta.gif.003 $WEBPIX//theta_08.gif
#keep $WEBPIX//theta_0[5-8].gif

# Run GDPLOT and generate ETA model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid1
GDATTIM	= f12-f48-12
DEVICE	= $device 
PANEL	= 0
TEXT	= 1.2/21//hw
CONTUR	= 1
MAP     = 31/1/1
CLEAR	= yes
CLRBAR  = 31

GAREA   = 23;-108;51;-65
PROJ	= lcc/25;-95;25
LATLON	= 0

GLEVEL	= 310 ! 310 ! 310
GVCORD	= thta ! thta !thta
GFUNC	= relh@310%thta ! pres@310%thta ! mixr@310%thta 
SCALE	= 999        ! 999 ! 999
CINT	= ! 30        ! 1;2;3;4;5;6;8;10;12;14;16;18 
LINE	= ! 2/1/2    !   32/5/2 
GVECT	=  wnd
WIND  =    bk32//3
TITLE	= ! 5/-2/ ~ ETA 310K PRES(RED), MIXR(BLACK), RH(color)
SKIP	= /2;2 ! /2;2
FINT	= 20 ! ! 
FLINE	= 20;18-17;21-24 ! ! 
CTYPE	= f ! c ! c
HLSYM   = 
HILO    = ! ! 
STNPLT  = 0 ! 0 ! 0
\$mapfil=hipowo.gsf
list
run

exit
EOF
#
# Run GPEND to clean up
#
#$GEMEXE/gpend

# Copy ps.plt to different name for eta model

cp theta.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_310K_theta_mixr_RH_f12.gif
cp theta.gif.001 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_310K_theta_mixr_RH_f24.gif
cp theta.gif.002 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_310K_theta_mixr_RH_f36.gif
cp theta.gif.003 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_310K_theta_mixr_RH_f48.gif

mv theta.gif $WEBPIX//theta_09.gif
mv theta.gif.001 $WEBPIX//theta_10.gif
mv theta.gif.002 $WEBPIX//theta_11.gif
mv theta.gif.003 $WEBPIX//theta_12.gif
#keep $WEBPIX//theta_09.gif $WEBPIX//theta_1[0-2].gif

rm $grid1
