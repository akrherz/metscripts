source ../COMMON.csh
setenv LOGFILE  logs/www_gfs2.log

#
set device="GF|gfs2.gif"
set grid=${MODEL}/gfs/${DATE}${1}_gfs215.gem

#
$GEMEXE/gdplot_gf << EOF > $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
PANEL	= 0
TEXT	= 1.2/21//hw
CONTUR	= 1
MAP     = 31/1/1
CLEAR	= yes
CLRBAR  = 31
GAREA	= 17;-122;53;-60
PROJ	= lcc/25;-95;25
LATLON	= 0

GLEVEL  = 0                !850              ! 700  !2
GVCORD  = none             !pres             !pres  !hght
GVECT   =
CINT    = 0.10;0.25;0.50;0.75;1.0;1.25;1.5;2.0!-5.0;0.0;2.0!-2.0;0.0;2.0 !-5.;0.;2.
LINE    = 20//2/0           !6/1/2          ! 7/1/2  ! 2/4/2
TITLE   = 5/-2/ ~ GFS 2M(RED),850MB(BLUE),700 MB T(C)|^ 2M,850,700 MB TMPC, PREC !0!0
SCALE   = 0
SKIP    = 0
FINT    = 0.05;0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0
FLINE   = 0;21-27;24;28-30;14;15;2;5
CTYPE   = f                !c                ! c  ! c
HILO    =                  !  !  !
HLSYM   =
STNPLT=0
\$mapfil=hipowo.gsf

GDATTIM	= f06
GFUNC   = (quo(APCP06,25.4)) !(tmpc) ! (tmpc)! (tmpc)
DEVICE	= $device 
run

GDATTIM	= f12
GFUNC   = (quo(sub(APCP12, APCP06^F06),25.4)) !(tmpc) ! (tmpc)! (tmpc)
DEVICE	= ${device}.001
run

GDATTIM	= f18
GFUNC   = (quo(sub(APCP18, APCP12^F12),25.4)) !(tmpc) ! (tmpc)! (tmpc)
DEVICE	= ${device}.002
run

GDATTIM	= f24
GFUNC   = (quo(sub(APCP24, APCP18^F18),25.4)) !(tmpc) ! (tmpc)! (tmpc)
DEVICE	= ${device}.003
run

GDATTIM	= f30
GFUNC   = (quo(sub(APCP30, APCP24^F24),25.4)) !(tmpc) ! (tmpc)! (tmpc)
DEVICE	= ${device}.004
run

GDATTIM	= f36
GFUNC   = (quo(sub(APCP36, APCP30^F30),25.4)) !(tmpc) ! (tmpc)! (tmpc)
DEVICE	= ${device}.005
run

GDATTIM	= f42
GFUNC   = (quo(sub(APCP42, APCP36^F36),25.4)) !(tmpc) ! (tmpc)! (tmpc)
DEVICE	= ${device}.006
run

GDATTIM	= f48
GFUNC   = (quo(sub(APCP48, APCP42^F42),25.4)) !(tmpc) ! (tmpc)! (tmpc)
DEVICE	= ${device}.007
run

exit
EOF
# Run GPEND to clean up
#
# Copy images to different name for eta model
if (-e gfs2.gif) then

  cp gfs2.gif ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f06.gif
  cp gfs2.gif.001 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f12.gif
  cp gfs2.gif.002 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f18.gif
  cp gfs2.gif.003 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f24.gif
  cp gfs2.gif.004 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f30.gif
  cp gfs2.gif.005 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f36.gif
  cp gfs2.gif.006 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f42.gif
  cp gfs2.gif.007 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f48.gif 

  mv gfs2.gif gfs2_01.gif
  mv gfs2.gif.001 gfs2_02.gif
  mv gfs2.gif.002 gfs2_03.gif
  mv gfs2.gif.003 gfs2_04.gif
  mv gfs2.gif.004 gfs2_05.gif
  mv gfs2.gif.005 gfs2_06.gif
  mv gfs2.gif.006 gfs2_07.gif
  mv gfs2.gif.007 gfs2_08.gif
  keep gfs2_0[1-8].gif
  mv gfs2_0[1-8].gif $WEBPIX/
endif

$GEMEXE/gdplot_gf << EOF > $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
PANEL	= 0
TEXT	= 1.2/21//hw
CONTUR	= 1
MAP     = 31/1/1
CLEAR	= yes
CLRBAR  = 31
GAREA	= 17;-122;53;-60
PROJ	= lcc/25;-95;25
LATLON	= 0

GLEVEL  = 0                !850              ! 700  !2
GVCORD  = none             !pres             !pres  !hght
GVECT   =
CINT    = 0.10;0.25;0.50;0.75;1.0;1.25;1.5;2.0!-5.0;0.0;2.0!-2.0;0.0;2.0 !-5.;0.;2.
LINE    = 20//2/0           !6/1/2          ! 7/1/2  ! 2/4/2
TITLE   = 5/-2/ ~ GFS 2M(RED),850MB(BLUE),700 MB T(C)|^ 2M,850,700 MB TMPC, PREC !0!0
SCALE   = 0
SKIP    = 0
FINT    = 0.05;0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0
FLINE   = 0;21-27;24;28-30;14;15;2;5
CTYPE   = f                !c                ! c  ! c
HILO    =                  !  !  !
HLSYM   =
STNPLT=0
\$mapfil=hipowo.gsf

GDATTIM	= f60
GFUNC   = (quo(sub(APCP60, APCP48^F48),25.4)) !(tmpc) ! (tmpc)! (tmpc)
DEVICE	= $device 
run

GDATTIM	= f72
GFUNC   = (quo(sub(APCP72, APCP60^F60),25.4)) !(tmpc) ! (tmpc)! (tmpc)
DEVICE	= ${device}.001
run

GDATTIM	= f84
GFUNC   = (quo(sub(APCP84, APCP72^F72),25.4)) !(tmpc) ! (tmpc)! (tmpc)
DEVICE	= ${device}.002
run

GDATTIM	= f96
GFUNC   = (quo(sub(APCP96, APCP84^F84),25.4)) !(tmpc) ! (tmpc)! (tmpc)
DEVICE	= ${device}.003
run

GDATTIM	= f108
GFUNC   = (quo(sub(APCP108, APCP96^F96),25.4)) !(tmpc) ! (tmpc)! (tmpc)
DEVICE	= ${device}.004
run

GDATTIM	= f120
GFUNC   = (quo(sub(APCP120, APCP108^F108),25.4)) !(tmpc) ! (tmpc)! (tmpc)
DEVICE	= ${device}.005
run

exit
EOF
#
# Copy images to different name for eta model
if (-e gfs2.gif) then

  cp gfs2.gif ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f60.gif
  cp gfs2.gif.001 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f72.gif
  cp gfs2.gif.002 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f84.gif
  cp gfs2.gif.003 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f96.gif
  cp gfs2.gif.004 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f108.gif
  cp gfs2.gif.005 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f120.gif

  mv gfs2.gif gfs2_09.gif
  mv gfs2.gif.001 gfs2_10.gif
  mv gfs2.gif.002 gfs2_10a.gif
  mv gfs2.gif.003 gfs2_10b.gif
  mv gfs2.gif.004 gfs2_10c.gif
  mv gfs2.gif.005 gfs2_10d.gif
  keep gfs2_09.gif gfs2_10.gif gfs2_10[a-d].gif
  mv gfs2_09.gif gfs2_10.gif gfs2_10[a-d].gif $WEBPIX/
endif
#
# Run GDPLOT and generate GFS model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f06-f48-06
DEVICE	= $device 
PANEL	= 0
TEXT	= 1.2/21//hw
CONTUR	= 1
MAP     = 31/1/1
CLEAR	= yes
CLRBAR  = 31

GAREA	= 15;-129;60;-45
PROJ	= lcc/25;-95;25
LATLON	= 0

GLEVEL	= 850                      !850    !850 
GVCORD	= pres                     !pres   !pres 
GFUNC	= dwpc                     !hght   !tmpc
SCALE	= 0                        ! 0    !0
CINT	= -20;-16;-12;-8;-4;0;4;8;10;12;14;16;18;20!30 !5    
LINE	= 7/5/1/2                  ! 2/1/2/1 !32/5/2/2
GVECT	= WND
WIND    = bk4/0.9
TITLE	= 5/-2/ ~ GFS   850 HGHTS, DEW POINTS, T (C) AND WIND|^ 850 Z,TD,T,WIND!0
SKIP	= /12;12 !
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
#
# Run GPEND to clean up
# Copy ps.plt to different name for eta model
if (-e gfs2.gif) then
  
  cp gfs2.gif ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_850mb_heights_T_Td_winds_f06.gif
  cp gfs2.gif.001 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_850mb_heights_T_Td_winds_f12.gif
  cp gfs2.gif.002 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_850mb_heights_T_Td_winds_f18.gif
  cp gfs2.gif.003 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_850mb_heights_T_Td_winds_f24.gif
  cp gfs2.gif.004 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_850mb_heights_T_Td_winds_f30.gif
  cp gfs2.gif.005 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_850mb_heights_T_Td_winds_f36.gif
  cp gfs2.gif.006 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_850mb_heights_T_Td_winds_f42.gif
  cp gfs2.gif.007 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_850mb_heights_T_Td_winds_f48.gif
  
  mv gfs2.gif gfs2_11.gif
  mv gfs2.gif.001 gfs2_12.gif
  mv gfs2.gif.002 gfs2_13.gif
  mv gfs2.gif.003 gfs2_14.gif
  mv gfs2.gif.004 gfs2_15.gif
  mv gfs2.gif.005 gfs2_16.gif
  mv gfs2.gif.006 gfs2_17.gif
  mv gfs2.gif.007 gfs2_18.gif
  keep gfs2_1[1-8].gif
  mv gfs2_1[1-8].gif $WEBPIX/
endif
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f60-f120-12
DEVICE	= $device 
PANEL	= 0
TEXT	= 1.2/21//hw
CONTUR	= 1
MAP     = 31/1/1
CLEAR	= yes
CLRBAR  = 31

GAREA	= 15;-129;60;-45
PROJ	= lcc/25;-95;25
LATLON	= 0

GLEVEL	= 850                      !850     !850
GVCORD	= pres                     !pres    !pres
GFUNC	= dwpc                     !hght    !tmpc
SCALE	= 0                        ! 0      !0
CINT	= -20;-16;-12;-8;-4;0;4;8;10;12;14;16;18;20!30!5     
LINE	= 7/5/1/2                  ! 2/1/2/1 !32/5/2/2
GVECT	= WND
WIND    = bk4/0.9
TITLE	= 5/-2/ ~ GFS  850 HGHTS, DEW POINTS, T (C) AND WIND|^ 850 Z,TD,T,WIND!0
SKIP	= /12;12 !
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
# Copy ps.plt to different name for eta model
if (-e gfs2.gif) then

  cp gfs2.gif ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_850mb_heights_T_Td_winds_f60.gif
  cp gfs2.gif.001 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_850mb_heights_T_Td_winds_f72.gif
  cp gfs2.gif.002 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_850mb_heights_T_Td_winds_f84.gif
  cp gfs2.gif.003 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_850mb_heights_T_Td_winds_f96.gif
  cp gfs2.gif.004 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_850mb_heights_T_Td_winds_f108.gif
  cp gfs2.gif.005 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_850mb_heights_T_Td_winds_f120.gif

  mv gfs2.gif gfs2_19.gif
  mv gfs2.gif.001 gfs2_20.gif
  mv gfs2.gif.002 gfs2_20a.gif
  mv gfs2.gif.003 gfs2_20b.gif
  mv gfs2.gif.004 gfs2_20c.gif
  mv gfs2.gif.005 gfs2_20d.gif
  keep gfs2_19.gif gfs2_20.gif gfs2_20[a-d].gif
  mv gfs2_19.gif gfs2_20.gif gfs2_20[a-d].gif $WEBPIX/
endif
#
# Run GDPLOT and generate GFS model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GAREA	= 15;-129;60;-45
PROJ	= lcc/25;-95;25
CLRBAR  = 31
GDATTIM	= f06-f48-06

GLEVEL	= 700 
GVCORD  = pres !pres !pres
GFUNC	= relh(tmpc,dwpc)    !tmpc           !hght
GVECT   = wnd  ! !
WIND    = bk2/0.8
skip    = /12;12 !
CINT	= 10;30;50;70;90 !-20;-10;-5;0;4;6;8;10;12;14;16;18   !30
LINE	= 7/5/1/2               !32/2/2/1             !4/1/2/2
HLSYM   = 
HILO    = 
SCALE	= 0  !0 !0 
TITLE	= 5/-2/ ~ GFS  700 HEIGHTS, RH and TEMP|^ 700 HGHT, RH AND TEMP!0!0
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
# Copy ps.plt to different name for eta model
if (-e gfs2.gif) then
 
  cp gfs2.gif ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_700mb_heights_RH_Temps_f06.gif
  cp gfs2.gif.001 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_700mb_heights_RH_Temps_f12.gif
  cp gfs2.gif.002 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_700mb_heights_RH_Temps_f18.gif
  cp gfs2.gif.003 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_700mb_heights_RH_Temps_f24.gif
  cp gfs2.gif.004 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_700mb_heights_RH_Temps_f30.gif
  cp gfs2.gif.005 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_700mb_heights_RH_Temps_f36.gif
  cp gfs2.gif.006 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_700mb_heights_RH_Temps_f42.gif
  cp gfs2.gif.007 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_700mb_heights_RH_Temps_f48.gif

  mv gfs2.gif gfs2_21.gif
  mv gfs2.gif.001 gfs2_22.gif
  mv gfs2.gif.002 gfs2_23.gif
  mv gfs2.gif.003 gfs2_24.gif
  mv gfs2.gif.004 gfs2_25.gif
  mv gfs2.gif.005 gfs2_26.gif
  mv gfs2.gif.006 gfs2_27.gif
  mv gfs2.gif.007 gfs2_28.gif
  keep gfs2_2[1-8].gif  
  mv gfs2_2[1-8].gif $WEBPIX/
endif
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GAREA	= 15;-129;60;-45
PROJ	= lcc/25;-95;25
CLRBAR  = 31
GDATTIM	= f60-f120-12

GLEVEL	= 700 
GVCORD  = pres !pres !pres
GFUNC	= relh(tmpc,dwpc)    !tmpc           !hght
GVECT   = wnd  ! !
WIND    = bk2/0.8
skip    = /12;12 !
CINT	= 10;30;50;70;90 !-20;-10;-5;0;4;6;8;10;12;14;16;18   !30
LINE	= 7/5/1/2               !32/2/2/1             !4/1/2/2
HLSYM   = 
HILO    = 
SCALE	= 0  !0 !0 
TITLE	= 5/-2/ ~ GFS  700 HEIGHTS, RH and TEMP|^ 700 HGHT, RH AND TEMP!0!0
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
# Copy ps.plt to different name for eta model
if (-e gfs2.gif) then
 
  cp gfs2.gif ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_700mb_heights_RH_Temps_f60.gif
  cp gfs2.gif.001 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_700mb_heights_RH_Temps_f72.gif
  cp gfs2.gif.002 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_700mb_heights_RH_Temps_f84.gif
  cp gfs2.gif.003 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_700mb_heights_RH_Temps_f96.gif
  cp gfs2.gif.004 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_700mb_heights_RH_Temps_f108.gif
  cp gfs2.gif.005 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_700mb_heights_RH_Temps_f120.gif 

  mv gfs2.gif gfs2_29.gif
  mv gfs2.gif.001 gfs2_30.gif
  mv gfs2.gif.002 gfs2_30a.gif
  mv gfs2.gif.003 gfs2_30b.gif
  mv gfs2.gif.004 gfs2_30c.gif
  mv gfs2.gif.005 gfs2_30d.gif
  keep gfs2_29.gif gfs2_30.gif gfs2_30[a-d].gif  
  mv gfs2_29.gif gfs2_30.gif gfs2_30[a-d].gif $WEBPIX/
endif
# Run GDPLOT and generate GFS model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GAREA	= 15;-129;60;-45
PROJ	= lcc/25;-95;25
CLRBAR  = 31
GDATTIM	= f06-f48-06

GLEVEL	= 250  
GVCORD	= pres !pres  !pres
GFUNC	= sped !hght  !sm9s(sm9s(sm9s(div(wnd))))
GVECT	= ! !
CINT	= 10;20;30;40;50;60;70;80;90! 120 !2
LINE	= 7/5/1/2           !31/1/2/2  !29/1/1/1
TITLE	= 5/-2/ ~ GFS  250 MB HGHTS, WIND SPEED (M/S) AND DIV|^ 250 MB HGHTS, SPEEDS, DIV!0!
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
# Copy ps.plt to different name for eta model
#mv ps.plt ps.plt_eta
if (-e gfs2.gif) then

  cp gfs2.gif ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_250mb_heights_winds_DIV_f06.gif
  cp gfs2.gif.001 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_250mb_heights_winds_DIV_f12.gif
  cp gfs2.gif.002 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_250mb_heights_winds_DIV_f18.gif
  cp gfs2.gif.003 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_250mb_heights_winds_DIV_f24.gif
  cp gfs2.gif.004 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_250mb_heights_winds_DIV_f30.gif
  cp gfs2.gif.005 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_250mb_heights_winds_DIV_f36.gif
  cp gfs2.gif.006 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_250mb_heights_winds_DIV_f42.gif
  cp gfs2.gif.007 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_250mb_heights_winds_DIV_f48.gif

  mv gfs2.gif gfs2_31.gif
  mv gfs2.gif.001 gfs2_32.gif
  mv gfs2.gif.002 gfs2_33.gif
  mv gfs2.gif.003 gfs2_34.gif
  mv gfs2.gif.004 gfs2_35.gif
  mv gfs2.gif.005 gfs2_36.gif
  mv gfs2.gif.006 gfs2_37.gif
  mv gfs2.gif.007 gfs2_38.gif
  keep gfs2_3[1-8].gif 
  mv gfs2_3[1-8].gif $WEBPIX/
endif

# Run GDPLOT and generate GFS model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GAREA	= 15;-129;60;-45
PROJ	= lcc/25;-95;25
CLRBAR  = 31
GDATTIM	= f60-f120-12

GLEVEL	= 250  
GVCORD	= pres !pres  !pres
GFUNC	= sped !hght  !sm9s(sm9s(sm9s(div(wnd))))
GVECT	= ! !
CINT	= 10;20;30;40;50;60;70;80;90! 120 !2
LINE	= 7/5/1/2           !31/1/2/2  !29/1/1/1
TITLE	= 5/-2/ ~ GFS  250 MB HGHTS, WIND SPEED (M/S) AND DIV|^ 250 MB HGHTS, SPEEDS, DIV!0!
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
# Copy ps.plt to different name for eta model
#mv ps.plt ps.plt_eta
if (-e gfs2.gif) then
 
  cp gfs2.gif ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_250mb_heights_winds_DIV_f60.gif
  cp gfs2.gif.001 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_250mb_heights_winds_DIV_f72.gif
  cp gfs2.gif.002 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_250mb_heights_winds_DIV_f84.gif
  cp gfs2.gif.003 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_250mb_heights_winds_DIV_f96.gif
  cp gfs2.gif.004 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_250mb_heights_winds_DIV_f108.gif
  cp gfs2.gif.005 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_250mb_heights_winds_DIV_f120.gif

  mv gfs2.gif gfs2_39.gif
  mv gfs2.gif.001 gfs2_40.gif
  mv gfs2.gif.002 gfs2_40a.gif
  mv gfs2.gif.003 gfs2_40b.gif
  mv gfs2.gif.004 gfs2_40c.gif
  mv gfs2.gif.005 gfs2_40d.gif
  keep gfs2_39.gif gfs2_40.gif gfs2_40[a-d].gif 
  mv gfs2_39.gif gfs2_40.gif gfs2_40[a-d].gif $WEBPIX/
endif

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE  = $grid
GDATTIM = f06-f72-06
DEVICE  = $device
PANEL   = 0
TEXT    = 1.2/21//hw
CONTUR  = 1
MAP     = 31/1/1
CLEAR   = yes
CLRBAR  = 31
GAREA   = 15;-129;60;-45
PROJ    = lcc/25;-95;25
LATLON  = 0
                                                                                                 
GLEVEL  = 2      !2 !10
GVCORD  = hght
GFUNC   = dwpf!tmpf!
GVECT   =   !      !wnd
WIND    = !  !bk29/0.8
SKIP    = !    !/12;12
SCALE   = 0 ! 0 !
CINT    = 5! 5 !
LINE    = 2/1/1/2           !32/1/2 !
TITLE   = 5/-2/ ~ GFS SFC T, DEW POINT (shaded) & WINDS |^ SFC T,DEW POINT & WINDS! 0
FINT    = -60;-10;0;10;20;25;30;40;50;55;60;65;70;75;80! !
FLINE   = 0;27-16--1;14-8--1
CTYPE   = c/f                !c !
HILO    =                  !
STNPLT  =0 !
\$mapfil=hipowo.gsf
list
run


exit
EOF

cp gfs2.gif ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_sfcT_Td_wind_f06.gif
cp gfs2.gif.001 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_sfcT_Td_wind_f12.gif
cp gfs2.gif.002 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_sfcT_Td_wind_f18.gif
cp gfs2.gif.003 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_sfcT_Td_wind_f24.gif
cp gfs2.gif.004 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_sfcT_Td_wind_f30.gif
cp gfs2.gif.005 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_sfcT_Td_wind_f36.gif
cp gfs2.gif.006 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_sfcT_Td_wind_f42.gif
cp gfs2.gif.007 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_sfcT_Td_wind_f48.gif
cp gfs2.gif.008 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_sfcT_Td_wind_f54.gif
cp gfs2.gif.009 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_sfcT_Td_wind_f60.gif
cp gfs2.gif.010 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_sfcT_Td_wind_f66.gif
cp gfs2.gif.011 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_sfcT_Td_wind_f72.gif

mv gfs2.gif gfs2_41.gif
mv gfs2.gif.001 gfs2_42.gif
mv gfs2.gif.002 gfs2_43.gif
mv gfs2.gif.003 gfs2_44.gif
mv gfs2.gif.004 gfs2_45.gif
mv gfs2.gif.005 gfs2_46.gif
mv gfs2.gif.006 gfs2_47.gif
mv gfs2.gif.007 gfs2_48.gif
mv gfs2.gif.008 gfs2_49.gif
mv gfs2.gif.009 gfs2_50.gif
mv gfs2.gif.010 gfs2_51.gif
mv gfs2.gif.011 gfs2_52.gif
keep gfs2_4[1-9].gif gfs2_5?.gif
mv gfs2_4[1-9].gif gfs2_5?.gif $WEBPIX/


$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE  = $grid
GDATTIM = f84-f120-12
DEVICE  = $device
PANEL   = 0
TEXT    = 1.2/21//hw
CONTUR  = 1
MAP     = 31/1/1
CLEAR   = yes
CLRBAR  = 31
GAREA   = 15;-129;60;-45
PROJ    = lcc/25;-95;25
LATLON  = 0
                                                                                                 
GLEVEL  =        !2 !10
GVCORD  = hght
GFUNC   =     !tmpf!
GVECT   =   !      !wnd
WIND    = !  !bk29/0.8
SKIP    = !    !/12;12
SCALE   = 0 ! 0 !
CINT    =  ! 5 !
LINE    = 2/1/1/2           !3/1/2 !
TITLE   = 5/-2/ ~ GFS SFC T, DEW POINT (shaded) & WINDS |^ SFC T,DEW POINT & WINDS! 0
FINT    = -60;-10;0;10;20;25;30;40;50;55;60;65;70;75;80! !
FLINE   = 0;27-16--1;14-8--1
CTYPE   =                    !c !
HILO    =                  !
STNPLT  =0 !
\$mapfil=hipowo.gsf
list
run


exit
EOF

cp gfs2.gif ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_sfcT_Td_wind_f84.gif
cp gfs2.gif.001 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_sfcT_Td_wind_f96.gif
cp gfs2.gif.002 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_sfcT_Td_wind_f108.gif
cp gfs2.gif.003 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_sfcT_Td_wind_f120.gif

mv gfs2.gif gfs2_50a.gif
mv gfs2.gif.001 gfs2_50b.gif
mv gfs2.gif.002 gfs2_50c.gif
mv gfs2.gif.003 gfs2_50d.gif
keep gfs2_50[a-d].gif 
mv  gfs2_50[a-d].gif $WEBPIX/
