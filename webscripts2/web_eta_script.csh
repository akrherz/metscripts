source ../COMMON.csh
setenv DATA_DIR	/data/gempak/model
setenv LOGFILE 	logs/www_eta.log

mkdir -p ${ddir2}/pix/eta/${1}z
set device="GF|eta.gif"
set grid=${DATA_DIR}/nam/${DATE}${1}_nam212.gem

$GEMEXE/gdplot_gf << EOF > $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f12-f60-12
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

GLEVEL	= 500:1000                  !0
GVCORD	= pres                      !none
GFUNC	= (sub(hght@500,hght@1000)) !emsl@0%none
SCALE	= -1                        ! 0
CINT	= 6                         ! 4
LINE	= 3/3/1                     ! 20//2
GVECT	=
TITLE	= 5/-2/ ~ ETA   MSL PRESSURE, 1000-500 MB THICKNESS|^ MSLP, 1000-500 THKN!0
SKIP	= 1
FINT	=
FLINE	=
CTYPE	= c
HLSYM   = 2;1.5//21//hw
HILO    = ! 25;2/H#;L#///30;30/y 
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
#cp eta.gif ${ddir}${DATE2}

cp eta.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_MSLP_1000_500mb_Thickness_f12.gif
cp eta.gif.001 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_MSLP_1000_500mb_Thickness_f24.gif
cp eta.gif.002 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_MSLP_1000_500mb_Thickness_f36.gif
cp eta.gif.003 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_MSLP_1000_500mb_Thickness_f48.gif
cp eta.gif.004 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_MSLP_1000_500mb_Thickness_f60.gif

mv eta.gif eta_01.gif
mv eta.gif.001 eta_02.gif
mv eta.gif.002 eta_03.gif
mv eta.gif.003 eta_04.gif
mv eta.gif.004 eta_04b.gif
keep eta_0[1-4].gif eta_04b.gif
mv eta_0[1-4].gif eta_04b.gif $WEBPIX/
#
# Run GDPLOT and generate ETA model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GVCORD  = pres
GLEVEL	= 500
GVECT	= WND ! 
WIND    = bk31
SKIP    = /6;6 !
GFUNC	= sm9s(sm9s(sm9s(avor(wnd)))) !sm9s(sm9s(sm9s(avor(wnd))))   !hght
CINT	= 2/10/99               !2/4/8                 !6
LINE	= 7/5/1/2               !4/5/1/2               !19/1/2/1
HILO	= 2;6/X;N/10-99;10-99   !
SCALE	= 5                     !5                     ! -1
TITLE	= 5/-2/ ~ ETA  500 HEIGHTS AND VORTICITY|^ 500 HGHT AND VORTICITY!0
PROJ	= lcc/25;-95;25/1,3,0,0
FINT	= 16;20;24;28;32;36;40;44
FLINE	= 0;23-15
CTYPE	= c/f ! c
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

cp eta.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_500mb_heights_vorticity_f12.gif
cp eta.gif.001 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_500mb_heights_vorticity_f24.gif
cp eta.gif.002 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_500mb_heights_vorticity_f36.gif
cp eta.gif.003 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_500mb_heights_vorticity_f48.gif
cp eta.gif.004 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_500mb_heights_vorticity_f60.gif

mv eta.gif eta_05.gif
mv eta.gif.001 eta_06.gif
mv eta.gif.002 eta_07.gif
mv eta.gif.003 eta_08.gif
mv eta.gif.004 eta_08b.gif
keep eta_0[5-8].gif eta_08b.gif
mv eta_0[5-8].gif eta_08b.gif $WEBPIX/

# Run GDPLOT and generate ETA model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= F12-F60-12
GLEVEL  = 0 ! 0 ! 0 ! 700
GVCORD  = pres!pres!none!pres
GFUNC   = (quo(p12m,25.4)) !(quo(p12m,25.4)) ! emsl@0%none !sm9s(sm9s(omeg@700%pres))
GVECT	=
CINT	= 3.!0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0!4!8
LINE	= 20//1/0           !30//1/0          ! 5/1/1/3 !2/1/1/1
TITLE	= 5/-2/ ~ ETA  12-HR TOTAL PCPN, MSLP, 700 VV|^ 12-HRLY TOT PCPN, MSLP, 700 VV!0!0
SCALE	= 0 !0!0! 3
SKIP	= 0
FINT    = 0.01;0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0
FLINE   = 0;21-27;24;28-30;14;15;2;5
CTYPE	= f                !c                ! c  ! c
HILO    =                  !                 !25;2////30;30/y !
HLSYM   = 2;1.5//21//hw
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

cp eta.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_12hr_precip_MSLP_700VV_f12.gif
cp eta.gif.001 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_12hr_precip_MSLP_700VV_f24.gif 
cp eta.gif.002 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_12hr_precip_MSLP_700VV_f36.gif
cp eta.gif.003 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_12hr_precip_MSLP_700VV_f48.gif
cp eta.gif.004 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_12hr_precip_MSLP_700VV_f60.gif

mv eta.gif eta_09.gif
mv eta.gif.001 eta_10.gif
mv eta.gif.002 eta_11.gif
mv eta.gif.003 eta_12.gif
mv eta.gif.004 eta_12b.gif
keep eta_09.gif eta_1[0-2].gif eta_12b.gif
mv eta_09.gif eta_1[0-2].gif eta_12b.gif $WEBPIX/
#
#endif


