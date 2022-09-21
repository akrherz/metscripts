
source ../COMMON.csh

setenv LOGFILE 	logs/www_eta4.log

set device="GF|eta4.gif"
set grid=${MODEL}/nam/${DATE}${1}_nam212.gem

$GEMEXE/gdplot_gf << EOF > $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f06-f54-12
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

if (-e eta4.gif) then

  cp eta4.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_MSLP_1000_500mb_Thickness_f06.gif
  cp eta4.gif.001 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_MSLP_1000_500mb_Thickness_f18.gif
  cp eta4.gif.002 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_MSLP_1000_500mb_Thickness_f30.gif
  cp eta4.gif.003 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_MSLP_1000_500mb_Thickness_f42.gif
  cp eta4.gif.004 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_MSLP_1000_500mb_Thickness_f54.gif

  mv eta4.gif eta4_01.gif
  mv eta4.gif.001 eta4_02.gif
  mv eta4.gif.002 eta4_03.gif
  mv eta4.gif.003 eta4_04.gif
  mv eta4.gif.004 eta4_04b.gif
  keep eta4_0[1-4].gif eta4_04b.gif
  mv eta4_0[1-4].gif eta4_04b.gif $WEBPIX/
endif
#
# Run GDPLOT and generate ETA model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GVCORD  = pres
GLEVEL	= 500
GVECT   = WND !
SKIP    = /6;6!
WIND    = bk31/0.8
GFUNC	= sm9s(sm9s(sm9s(avor(wnd)))) !sm9s(sm9s(sm9s(avor(wnd))))    !hght
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
if (-e eta4.gif) then
 
  cp eta4.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_500mb_heights_vorticity_f06.gif
  cp eta4.gif.001 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_500mb_heights_vorticity_f18.gif
  cp eta4.gif.002 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_500mb_heights_vorticity_f30.gif
  cp eta4.gif.003 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_500mb_heights_vorticity_f42.gif
  cp eta4.gif.004 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_500mb_heights_vorticity_f54.gif

  mv eta4.gif eta4_05.gif
  mv eta4.gif.001 eta4_06.gif
  mv eta4.gif.002 eta4_07.gif
  mv eta4.gif.003 eta4_08.gif
  mv eta4.gif.004 eta4_08b.gif
  keep eta4_0[5-8].gif eta4_08b.gif
  mv eta4_0[5-8].gif eta4_08b.gif $WEBPIX/
endif

# Run GDPLOT and generate ETA model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= F06-F54-12
GLEVEL	= 0 ! 0 ! 0 ! 700
GVCORD	= pres !pres!   none !pres
GFUNC	= (quo(p12m,25.4)) !(quo(p12m,25.4)) ! emsl@0%none !sm9s(sm9s(omeg@700%pres))
GVECT	=
CINT	= /.1/.1!0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0!4!8
LINE	= 20//1/0           !30//1/0          ! 5/1/1/3! 2/1/1/1
TITLE	= 5/-2/ ~ ETA  12-HR TOT PCPN, MSLP, 700 VV|^ 12-HRLY TOT PCPN, MSLP, 700 VV!0!0!0
SCALE	= 0 ! 0 ! 0 ! 3
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
if (-e eta4.gif) then
 
  cp eta4.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_12hr_precip_MSLP_700VV_f06.gif
  cp eta4.gif.001 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_12hr_precip_MSLP_700VV_f18.gif
  cp eta4.gif.002 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_12hr_precip_MSLP_700VV_f30.gif
  cp eta4.gif.003 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_12hr_precip_MSLP_700VV_f42.gif
  cp eta4.gif.004 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_12hr_precip_MSLP_700VV_f54.gif

  mv eta4.gif eta4_09.gif
  mv eta4.gif.001 eta4_10.gif
  mv eta4.gif.002 eta4_11.gif
  mv eta4.gif.003 eta4_12.gif
  mv eta4.gif.004 eta4_12b.gif
  keep eta4_09.gif eta4_1[0-2].gif eta4_12b.gif
  mv eta4_09.gif eta4_1[0-2].gif eta4_12b.gif $WEBPIX/
endif
