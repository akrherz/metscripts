source ../COMMON.csh
setenv LOGFILE 	logs/www_eta5.log

set device="GF|eta5.gif"
set grid=${MODEL}/nam/${DATE}${1}_nam212.gem

$GEMEXE/gdplot_gf << EOF > $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f06-f54-06
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

GLEVEL	= 850                      !850     !850
GVCORD	= pres                     !pres    !pres
GFUNC	= dwpc                     !hght    !tmpc
SCALE	= 0                        ! 0     !0
CINT	= -20;-16;-12;-8;-4;0;4;8;10;12;14;16;18;20  ! 30 !4    
LINE	= 7/5/1/2                  ! 2/1/2/1 !32/1/1/1
GVECT	= WND
WIND    = bk4/0.7/2
TITLE	= 5/-2/ ~ ETA   850 HGHTS, DEW POINTS (C),T AND WIND|^ 850 Z, TD, T, WIND!0
SKIP	= /4;4 !
FINT	= -20;-16;-12;-8;-4;0;4;8;10;12;14;16;18;20
FLINE	= 27;26-16--1;14-8--2 !
CTYPE	= f ! c !c
HLSYM   = 
HILO    = 
STNPLT  = 0
\$mapfil=hipowo.gsf
list
run


exit
EOF


if (-e eta5.gif) then

  cp eta5.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_850mb_heights_T_Td_winds_f06.gif
  cp eta5.gif.001 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_850mb_heights_T_Td_winds_f12.gif
  cp eta5.gif.002 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_850mb_heights_T_Td_winds_f18.gif
  cp eta5.gif.003 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_850mb_heights_T_Td_winds_f24.gif  
  cp eta5.gif.004 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_850mb_heights_T_Td_winds_f30.gif
  cp eta5.gif.005 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_850mb_heights_T_Td_winds_f36.gif
  cp eta5.gif.006 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_850mb_heights_T_Td_winds_f42.gif
  cp eta5.gif.007 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_850mb_heights_T_Td_winds_f48.gif
  cp eta5.gif.008 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_850mb_heights_T_Td_winds_f54.gif

  mv eta5.gif eta5_01.gif
  mv eta5.gif.001 eta5_02.gif
  mv eta5.gif.002 eta5_03.gif
  mv eta5.gif.003 eta5_04.gif
  mv eta5.gif.004 eta5_05.gif
  mv eta5.gif.005 eta5_06.gif
  mv eta5.gif.006 eta5_07.gif
  mv eta5.gif.007 eta5_08.gif
  mv eta5.gif.008 eta5_08b.gif
  keep eta5_0[1-8].gif eta5_08b.gif 
  mv eta5_0[1-8].gif eta5_08b.gif $WEBPIX/
endif
#
# Run GDPLOT and generate ETA model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GAREA	= grid
PROJ	= lcc/25;-95;25
CLRBAR  = 31

GLEVEL	= 700 
GVCORD  = pres !pres !pres
GFUNC	= relh !tmpc           !hght
GVECT   = wnd  ! !
WIND    = bk2/0.7/2
skip    = /4;4 !
CINT	= 10;30;50;70;90 !-20;-10;-5;0;4;6;8;10;12;14;16;18   !30
LINE	= 7/5/1/2               !32/1/1/1             !4/1/2/2
HLSYM   = 
HILO    = 
SCALE	= 0  !0 !0 
TITLE	= 5/-2/ ~ ETA  700 HEIGHTS, RH and TEMP|^ 700 HGHT, RH AND TEMP!0!0
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

if (-e eta5.gif) then
 
  cp eta5.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_700mb_heights_RH_Temps_f06.gif
  cp eta5.gif.001 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_700mb_heights_RH_Temps_f12.gif 
  cp eta5.gif.002 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_700mb_heights_RH_Temps_f18.gif
  cp eta5.gif.003 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_700mb_heights_RH_Temps_f24.gif
  cp eta5.gif.004 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_700mb_heights_RH_Temps_f30.gif
  cp eta5.gif.005 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_700mb_heights_RH_Temps_f36.gif
  cp eta5.gif.006 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_700mb_heights_RH_Temps_f42.gif
  cp eta5.gif.007 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_700mb_heights_RH_Temps_f48.gif
  cp eta5.gif.008 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_700mb_heights_RH_Temps_f54.gif

  mv eta5.gif eta5_09.gif
  mv eta5.gif.001 eta5_10.gif
  mv eta5.gif.002 eta5_11.gif
  mv eta5.gif.003 eta5_12.gif
  mv eta5.gif.004 eta5_13.gif
  mv eta5.gif.005 eta5_14.gif
  mv eta5.gif.006 eta5_15.gif
  mv eta5.gif.007 eta5_16.gif
  mv eta5.gif.008 eta5_16b.gif
  keep eta5_1[0-6].gif eta5_09.gif eta5_16b.gif
  mv eta5_1[0-6].gif eta5_09.gif eta5_16b.gif $WEBPIX/
endif

#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GAREA	= grid
PROJ	= lcc/25;-95;25
CLRBAR  = 31

GLEVEL	= 250  
GVCORD	= pres !pres  !pres
GFUNC	= sped !hght  !sm9s(sm9s(sm9s(sm9s(div(wnd)))))
GVECT	= ! !
CINT	= 10;20;30;40;50;60;70;80;90! 120 !2;4;6;8;10;15;20
LINE	= 7/5/1/2           !31/1/2/2  !29/1/1/1
TITLE	= 5/-2/ ~ ETA  250 MB HGHTS, WIND SPEED (M/S) AND DIV|^ 250 MB HGHTS, SPEEDS, DIV!0!
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

if (-e eta5.gif) then

  cp eta5.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_250mb_heights_winds_DIV_f06.gif
  cp eta5.gif.001 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_250mb_heights_winds_DIV_f12.gif
  cp eta5.gif.002 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_250mb_heights_winds_DIV_f18.gif
  cp eta5.gif.003 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_250mb_heights_winds_DIV_f24.gif
  cp eta5.gif.004 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_250mb_heights_winds_DIV_f30.gif
  cp eta5.gif.005 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_250mb_heights_winds_DIV_f36.gif
  cp eta5.gif.006 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_250mb_heights_winds_DIV_f42.gif
  cp eta5.gif.007 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_250mb_heights_winds_DIV_f48.gif
  cp eta5.gif.008 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_250mb_heights_winds_DIV_f54.gif
 
  mv eta5.gif eta5_17.gif
  mv eta5.gif.001 eta5_18.gif
  mv eta5.gif.002 eta5_19.gif
  mv eta5.gif.003 eta5_20.gif
  mv eta5.gif.004 eta5_21.gif
  mv eta5.gif.005 eta5_22.gif
  mv eta5.gif.006 eta5_23.gif
  mv eta5.gif.007 eta5_24.gif
  mv eta5.gif.008 eta5_24b.gif
  keep eta5_1[7-9].gif eta5_2[0-4].gif eta5_24b.gif
  mv eta5_1[7-9].gif eta5_2[0-4].gif eta5_24b.gif $WEBPIX/
endif
