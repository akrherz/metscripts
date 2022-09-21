source ../COMMON.csh

setenv LOGFILE 	logs/www_ruc2.log

set device="GF|ruc2.gif"
set grid=/data/gempak/model/ruc/${DATE}${1}_ruc236.gem

$GEMEXE/gdplot_gf << EOF > $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f00-f12-03
DEVICE	= $device 
PANEL	= 0
TEXT	= 1.2/21//hw
CONTUR	= 1
MAP     = 31/1/1
CLEAR	= yes
CLRBAR  = 31

GAREA	= grid
PROJ	= lcc/25;-95;25
LATLON	= 0

GLEVEL	= 850                      !850  !850   
GVCORD	= pres                     !pres !pres   
GFUNC	= dwpc                     !hght !tmpc  
SCALE	= 0                        ! 0   !0 
CINT	= -20;-16;-12;-8;-4;0;4;8;10;12;14;16;18;20  ! 30 !4    
LINE	= 7/5/1/2                  ! 2/1/2/1 !32/5/2/2
GVECT	= WND
WIND    = bk4/0.9
TITLE	= 5/-2/ ~ RUC   850 HGHTS, DEW POINTS, T (C) AND WIND|^ 850 Z, TD, T, WIND!0
SKIP	= /4;4 !
FINT	= -20;-16;-12;-8;-4;0;4;8;10;12;14;16;18;20
FLINE	= 27;26-16--1;14-8--2 !
CTYPE	= f ! c  !c
HLSYM   = 
HILO    = 
STNPLT  = 0
\$mapfil=hipowo.gsf
list
run


exit
EOF
#
# Run GPEND to clean up
#

# Copy ps.plt to different name for ruc model
if (-e ruc2.gif) then

  cp ruc2.gif ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_850mb_heights_T_Td_winds_f00.gif
  cp ruc2.gif.001 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_850mb_heights_T_Td_winds_f03.gif
  cp ruc2.gif.002 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_850mb_heights_T_Td_winds_f06.gif
  cp ruc2.gif.003 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_850mb_heights_T_Td_winds_f09.gif
  cp ruc2.gif.004 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_850mb_heights_T_Td_winds_f12.gif

  mv ruc2.gif ruc2_01.gif
  mv ruc2.gif.001 ruc2_02.gif
  mv ruc2.gif.002 ruc2_03.gif
  mv ruc2.gif.003 ruc2_04.gif
  mv ruc2.gif.004 ruc2_05.gif
  keep ruc2_0[1-5].gif
  mv ruc2_0[1-5].gif $WEBPIX/
endif
#
# Run GDPLOT and generate RUC model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GAREA	= grid
PROJ	= lcc/25;-95;25
CLRBAR  = 31

GLEVEL	= 700 
GVCORD  = pres !pres !pres
GFUNC	= relh(tmpc,dwpc)    !tmpc           !hght
GVECT   = wnd  ! !
WIND    = bk2/0.9
skip    = /4;4 !
CINT	= 10;30;50;70;90 !-20;-10;-5;0;4;6;8;10;12;14;16;18   !30
LINE	= 7/5/1/2               !32/2/2/1             !4/1/2/2
HLSYM   = 
HILO    = 
SCALE	= 0  !0 !0 
TITLE	= 5// ~ RUC  700 HEIGHTS, RH and TEMP|^ 700 HGHT, RH AND TEMP!0!0
FINT	= 10;30;50;70;90
FLINE	= 15;11;17-23-2
CTYPE	= f ! c
STNPLT  = 0
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
if (-e ruc2.gif) then
 
  cp ruc2.gif ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_700mb_heights_RH_Temps_f00.gif
  cp ruc2.gif.001 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_700mb_heights_RH_Temps_f03.gif
  cp ruc2.gif.002 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_700mb_heights_RH_Temps_f06.gif
  cp ruc2.gif.003 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_700mb_heights_RH_Temps_f09.gif
  cp ruc2.gif.004 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_700mb_heights_RH_Temps_f12.gif

  mv ruc2.gif ruc2_06.gif
  mv ruc2.gif.001 ruc2_07.gif
  mv ruc2.gif.002 ruc2_08.gif
  mv ruc2.gif.003 ruc2_09.gif
  mv ruc2.gif.004 ruc2_10.gif
  keep ruc2_0[6-9].gif ruc2_10.gif
  mv ruc2_0[6-9].gif ruc2_10.gif $WEBPIX/
endif

# Run GDPLOT and generate RUC model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GAREA	= grid
PROJ	= lcc/25;-95;25
CLRBAR  = 31

GLEVEL	= 250  
GVCORD	= pres !pres  !pres
GFUNC	= sped !hght  !div(wnd)
GVECT	= ! !
CINT	= 10;20;30;40;50;60;70;80;90! 120 !2
LINE	= 7/5/1/2           !31/1/2/2  !29/1/1/1
TITLE	= 5// ~ RUC  250 MB HGHTS, WIND SPEED (M/S) AND DIV|^ 250 MB HGHTS, SPEEDS, DIV!0!
SCALE	= 0 ! 0 ! 5
SKIP	= 0 ! 0 ! 0
FINT    = 10;20;30;40;50;60;70;80;90!!
FLINE	= 0;26-16--2;14-8--2 
CTYPE	= f              !c
HLSYM   = 
HILO    = 
STNPLT  = 0
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
#mv ps.plt ps.plt_ruc
if (-e ruc2.gif) then
 
  cp ruc2.gif ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_250mb_heights_winds_DIV_f00.gif
  cp ruc2.gif.001 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_250mb_heights_winds_DIV_f03.gif
  cp ruc2.gif.002 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_250mb_heights_winds_DIV_f06.gif
  cp ruc2.gif.003 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_250mb_heights_winds_DIV_f09.gif
  cp ruc2.gif.004 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_250mb_heights_winds_DIV_f12.gif

  mv ruc2.gif ruc2_11.gif
  mv ruc2.gif.001 ruc2_12.gif
  mv ruc2.gif.002 ruc2_13.gif
  mv ruc2.gif.003 ruc2_14.gif
  mv ruc2.gif.004 ruc2_15.gif
  keep ruc2_1[1-5].gif 
  mv ruc2_1[1-5].gif $WEBPIX/
endif
#
