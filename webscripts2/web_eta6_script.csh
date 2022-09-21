
source ../COMMON.csh
setenv LOGFILE 	logs/www_eta6.log
#

#
# Set some variables for GDPLOT run
#
set device="GF|eta6.gif"
set grid=${MODEL}/nam/${DATE}${1}_nam212.gem
set grid1=${MODEL}/nam/${DATE}${1}_nam211.gem

$GEMEXE/gdplot_gf << EOF > $LOGFILE
\$RESPOND = YES
GDFILE	= $grid1
GDATTIM	= f06-f60-06
DEVICE	= $device 
PANEL	= 0
TEXT	= 1.2/21//hw
CONTUR	= 1
MAP     = 31/1/1
CLEAR	= yes
CLRBAR  = 31
GAREA	= 22;-120;53;-64
PROJ	= lcc/25;-95;25
LATLON	= 0

GLEVEL  = 0                !2      !2
GVCORD  = none             !hght   !hght
GFUNC=quo(mul(cape,hlcy@3000:0%hght),160000.)!dwpf!tmpf
GVECT   =                  !       !  
WIND    =                  !       ! 
SKIP    = 0                !       ! 
SCALE   = 0 ! 0 ! 0
CINT    = 0;0.5;1;1.5;2;3;4;5;6;7;8!45;50;55;60;65;70;75;80!60;70;75;80;85;90;95;100
LINE    = 3/1/1/2           !15/1/2 ! 31/1/1/1
TITLE   = 5/-2/ ~ ETA EHI, SFC T & DEW POINT   |^ EHI, SFC T & DEW POINT ! 0
FINT    = 1;1.5;2;3;4;5;6;7;8!
FLINE   = 0;26-16--2;14-8--2
CTYPE   = f                !c ! c
HILO    =                  !  ! 
STNPLT  =0
\$mapfil=hipowo.gsf
list
run

exit
EOF
#
# Run GPEND to clean up
#
# Copy images to different name for eta model

cp eta6.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_EHI_sfcT_Td_f06.gif
cp eta6.gif.001 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_EHI_sfcT_Td_f12.gif
cp eta6.gif.002 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_EHI_sfcT_Td_f18.gif
cp eta6.gif.003 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_EHI_sfcT_Td_f24.gif
cp eta6.gif.004 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_EHI_sfcT_Td_f30.gif
cp eta6.gif.005 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_EHI_sfcT_Td_f36.gif
cp eta6.gif.006 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_EHI_sfcT_Td_f42.gif
cp eta6.gif.007 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_EHI_sfcT_Td_f48.gif
cp eta6.gif.008 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_EHI_sfcT_Td_f54.gif
cp eta6.gif.009 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_EHI_sfcT_Td_f60.gif

mv eta6.gif eta6_01.gif
mv eta6.gif.001 eta6_02.gif
mv eta6.gif.002 eta6_03.gif
mv eta6.gif.003 eta6_04.gif
mv eta6.gif.004 eta6_05.gif
mv eta6.gif.005 eta6_06.gif
mv eta6.gif.006 eta6_07.gif
mv eta6.gif.007 eta6_08.gif
mv eta6.gif.008 eta6_08b.gif
mv eta6.gif.009 eta6_08c.gif
keep eta6_0[1-8].gif eta6_08b.gif eta6_08c.gif
mv eta6_0[1-8].gif eta6_08b.gif eta6_08c.gif $WEBPIX/
#
#
#! /bin/csh 
# Run GDPLOT and generate ETA model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f60
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

GLEVEL	= 850                      !850   !850  
GVCORD	= pres                     !pres   !pres 
GFUNC	= dwpc                     !hght   !tmpc
SCALE	= 0                        ! 0    !0
CINT	= -20;-16;-12;-8;-4;0;4;8;10;12;14;16;18;20  ! 30     !4
LINE	= 7/5/1/2                  ! 2/1/2/1  !32/1/1/1
GVECT	= WND
WIND    = bk4/0.8
TITLE	= 5/-2/ ~ ETA   850 HGHTS, DEW POINTS (C), T AND WIND|^ 850 Z, TD, T, WIND!0
SKIP	= /4;4 !
FINT	= -20;-16;-12;-8;-4;0;4;8;10;12;14;16;18;20
FLINE	= 27;26-16--1;14-8--2 !
CTYPE	= f ! c  ! c
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
# Copy ps.plt to different name for eta model
cp eta6.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_850mb_heights_T_Td_winds_f60.gif
mv eta6.gif eta6_09.gif
keep eta6_09.gif 
mv eta6_09.gif $WEBPIX/
#
# Run GDPLOT and generate ETA model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GAREA	= grid
PROJ	= lcc/25;-95;25
GDATTIM	= f60
CLRBAR  = 31

GLEVEL	= 700 
GVCORD  = pres !pres !pres
GFUNC	= relh(tmpc,dwpc)    !tmpc           !hght
GVECT   = wnd  ! !
WIND    = bk2
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
# Run GPEND to clean up
#
# Copy ps.plt to different name for eta model
cp eta6.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_700mb_heights_RH_Temps_f60.gif
mv eta6.gif eta6_10.gif
keep eta6_10.gif 
mv eta6_10.gif $WEBPIX/

# Run GDPLOT and generate ETA model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GAREA	= grid
PROJ	= lcc/25;-95;25
CLRBAR  = 31
GDATTIM	= f60

GLEVEL	= 250  
GVCORD	= pres !pres  !pres
GFUNC	= sped !hght  !sm9s(sm9s(sm9s(sm9s(div(wnd)))))
GVECT	= ! !
CINT	= 10;20;30;40;50;60;70;80;90! 120 !2
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
# Run GPEND to clean up
#
# Copy ps.plt to different name for eta model
#mv ps.plt ps.plt_eta
cp eta6.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_250mb_heights_winds_DIV_f60.gif
mv eta6.gif eta6_11.gif
keep eta6_11.gif 
mv eta6_11.gif $WEBPIX/

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE  = $grid1
GDATTIM = f06-f60-06
DEVICE  = $device
PANEL   = 0
TEXT    = 1.2/21//hw
CONTUR  = 1
MAP     = 31/1/1
CLEAR   = yes
CLRBAR  = 31
GAREA   = 15;-129;60;-55
PROJ    = lcc/25;-95;25
LATLON  = 0

GLEVEL  = 2      !2 !10
GVCORD  = hght
GFUNC   = dwpf!tmpf!
GVECT   =   !      !wnd
WIND    = !  !bk29/0.8
SKIP    = !    !/4;4
SCALE   = 0 ! 0 !
CINT    = 5! 5 !
LINE    = 2/1/1/2           !32/1/2 !
TITLE   = 5/-2/ ~ ETA SFC T, DEW POINT (shaded) & WINDS |^ SFC T,DEW POINT & WINDS! 0
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

cp eta6.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_sfcT_Td_winds_f06.gif
cp eta6.gif.001 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_sfcT_Td_winds_f12.gif
cp eta6.gif.002 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_sfcT_Td_winds_f18.gif
cp eta6.gif.003 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_sfcT_Td_winds_f24.gif
cp eta6.gif.004 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_sfcT_Td_winds_f30.gif
cp eta6.gif.005 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_sfcT_Td_winds_f36.gif
cp eta6.gif.006 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_sfcT_Td_winds_f42.gif
cp eta6.gif.007 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_sfcT_Td_winds_f48.gif
cp eta6.gif.008 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_sfcT_Td_winds_f54.gif
cp eta6.gif.009 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_sfcT_Td_winds_f60.gif

mv eta6.gif eta6_12.gif
mv eta6.gif.001 eta6_13.gif
mv eta6.gif.002 eta6_14.gif
mv eta6.gif.003 eta6_15.gif
mv eta6.gif.004 eta6_16.gif
mv eta6.gif.005 eta6_17.gif
mv eta6.gif.006 eta6_18.gif
mv eta6.gif.007 eta6_19.gif
mv eta6.gif.008 eta6_20.gif
mv eta6.gif.009 eta6_20b.gif
keep eta6_1[2-9].gif eta6_20.gif eta6_20b.gif
mv eta6_1[2-9].gif eta6_20.gif eta6_20b.gif $WEBPIX/

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE  = $grid1
GDATTIM = f06-f60-06
DEVICE  = $device
PANEL   = 0
TEXT    = 1.2/21//hw
CONTUR  = 1
MAP     = 31/1/1
CLEAR   = yes
CLRBAR  = 31
GAREA   = 22;-120;53;-64
PROJ    = lcc/25;-95;25
LATLON  = 0

GLEVEL  = 2   !0 
GVCORD  = hght!none
GFUNC   = mul(150,sub(tmpc,dwpc))!quo(mul(cape%none@0,hlcy@3000:0%hght),160000.)
GVECT   =     
WIND    = 
SKIP    = 
SCALE   = 0!0
CINT    = 200!1 
LINE    = 2/1/1/2 !5/1/2/2
TITLE   = 5/-2/ ~ ETA LCL HEIGHT AND EHI|^ LCL HEIGHT & EHI
FINT    = 200;600;800;1000;1200;1400;1600;1800;2000;2200;2400;2600;3000;3600;4600 !
FLINE   = 0;27-16--1;14-8--1 !
CTYPE   = c/f         !c 
HILO    =                  
STNPLT  =0 
\$mapfil=hipowo.gsf
list
run

exit
EOF

cp eta6.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_LCL_height_EHI_f06.gif
cp eta6.gif.001 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_LCL_height_EHI_f12.gif
cp eta6.gif.002 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_LCL_height_EHI_f18.gif
cp eta6.gif.003 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_LCL_height_EHI_f24.gif
cp eta6.gif.004 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_LCL_height_EHI_f30.gif
cp eta6.gif.005 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_LCL_height_EHI_f36.gif
cp eta6.gif.006 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_LCL_height_EHI_f42.gif
cp eta6.gif.007 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_LCL_height_EHI_f48.gif
cp eta6.gif.008 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_LCL_height_EHI_f54.gif
cp eta6.gif.009 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_LCL_height_EHI_f60.gif

mv eta6.gif eta6_21.gif
mv eta6.gif.001 eta6_22.gif
mv eta6.gif.002 eta6_23.gif
mv eta6.gif.003 eta6_24.gif
mv eta6.gif.004 eta6_25.gif
mv eta6.gif.005 eta6_26.gif
mv eta6.gif.006 eta6_27.gif
mv eta6.gif.007 eta6_28.gif
mv eta6.gif.008 eta6_29.gif
mv eta6.gif.009 eta6_29b.gif
keep eta6_2[1-9].gif eta6_29b.gif
mv eta6_2[1-9].gif eta6_29b.gif $WEBPIX/
#
$GEMEXE/gdcntr_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE  = $grid1
GDATTIM = f06-f60-06
DEVICE  = $device
PANEL   = 0
TEXT    = 1.2/21//hw
CONTUR  = 1
MAP     = 31/1/1
CLEAR   = yes
CLRBAR  = 31
GAREA   = 22;-120;53;-64
PROJ    = lcc/25;-95;25
LATLON  = 0

GLEVEL  = 180:0
GVCORD  = pdly
GFUNC   = quo(sub(mul(lft4,-644.),416.),mul(mag(vsub(wnd@600%pres,wnd@10%hght)),mag(vsub(wnd@600%pres,wnd@10%hght))))
GVECT   =     
WIND    = 
SKIP    = 
SCALE   = 0!0
CINT    = 15;25;35;45;75
LINE    = 5/1/1/3 
TITLE   = 5/-2/ ~ ETA BRN| ETA BRN
FINT    =  15;25;35;45;75
FLINE   = 0;26-16--2;14-8--2 
CTYPE   = cf
HILO    =                  
STNPLT  =0 
\$mapfil=hipowo.gsf
list
run

exit
EOF

cp eta6.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_BRN_f06.gif
cp eta6.gif.001 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_BRN_f12.gif
cp eta6.gif.002 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_BRN_f18.gif
cp eta6.gif.003 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_BRN_f24.gif
cp eta6.gif.004 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_BRN_f30.gif
cp eta6.gif.005 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_BRN_f36.gif
cp eta6.gif.006 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_BRN_f42.gif
cp eta6.gif.007 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_BRN_f48.gif
cp eta6.gif.008 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_BRN_f54.gif
cp eta6.gif.009 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_BRN_f60.gif

mv eta6.gif eta6_30.gif
mv eta6.gif.001 eta6_31.gif
mv eta6.gif.002 eta6_32.gif
mv eta6.gif.003 eta6_33.gif
mv eta6.gif.004 eta6_34.gif
mv eta6.gif.005 eta6_35.gif
mv eta6.gif.006 eta6_36.gif
mv eta6.gif.007 eta6_37.gif
mv eta6.gif.008 eta6_38.gif
mv eta6.gif.009 eta6_38b.gif
keep eta6_3[0-8].gif eta6_38b.gif
mv eta6_3[0-8].gif eta6_38b.gif $WEBPIX/
##CLEAR   = no
#endif
