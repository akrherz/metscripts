source ../COMMON.csh

setenv LOGFILE 	logs/www_ruc.log

set device="GF|ruc.gif"
set grid=/data/gempak/model/ruc/${DATE}${1}_ruc236.gem

#
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

GLEVEL	= 500:1000                  !0
GVCORD	= pres                      !none
GFUNC	= (sub(hght@500,hght@1000)) !mmsl@0%none
SCALE	= -1                        ! 0
CINT	= 6                         ! 4
LINE	= 3/3/1                     ! 20//2
GVECT	=
TITLE	= 5/-2/ ~ RAP   MSL PRESSURE, 1000-500 MB THICKNESS|^ MSLP, 1000-500 THKN!0
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


if (-e ruc.gif) then

  cp ruc.gif ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_MSLP_thickness_f00.gif
  cp ruc.gif.001 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_MSLP_thickness_f03.gif
  cp ruc.gif.002 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_MSLP_thickness_f06.gif
  cp ruc.gif.003 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_MSLP_thickness_f09.gif
  cp ruc.gif.004 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_MSLP_thickness_f12.gif

  mv ruc.gif ruc_01.gif
  mv ruc.gif.001 ruc_02.gif
  mv ruc.gif.002 ruc_03.gif
  mv ruc.gif.003 ruc_04.gif
  mv ruc.gif.004 ruc_05.gif
  keep ruc_0[1-5].gif
  mv ruc_0[1-5].gif $WEBPIX/
endif

#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GVCORD  = pres !pres  !pres
GLEVEL	= 500
GVECT	= WND ! 
WIND    = bk31
SKIP    = /4;4 !
GFUNC	= (avor(wnd))           !(avor(wnd))           !hght
CINT	= 2/10/99               !2/4/8                 !6
LINE	= 7/5/1/2               !4/5/1/2               !19/1/2/1
HILO	= 2;6/X;N/10-99;10-99   !
SCALE	= 5                     !5                     ! -1
TITLE	= 5// ~ RAP  500 HEIGHTS AND VORTICITY|^ 500 HGHT AND VORTICITY!0
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

if (-e ruc.gif) then

  cp ruc.gif ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_500mb_heights_vort_f00.gif
  cp ruc.gif.001 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_500mb_heights_vort_f03.gif
  cp ruc.gif.002 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_500mb_heights_vort_f06.gif
  cp ruc.gif.003 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_500mb_heights_vort_f09.gif
  cp ruc.gif.004 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_500mb_heights_vort_f12.gif

  mv ruc.gif ruc_06.gif
  mv ruc.gif.001 ruc_07.gif
  mv ruc.gif.002 ruc_08.gif
  mv ruc.gif.003 ruc_09.gif
  mv ruc.gif.004 ruc_10.gif
  keep ruc_0[6-9].gif ruc_10.gif
  mv ruc_0[6-9].gif ruc_10.gif $WEBPIX/
endif

# Run GDPLOT and generate ETA model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= F01-F15-01
GLEVEL	= 0 ! 0 ! 0 !700
GVCORD	= NONE ! NONE !   none  
GFUNC	= (quo(APCP01,25.4)) !(quo(APCP01,25.4)) ! mmsl@0%none 
GVECT	=
CINT	= /.1/.1!0.10;0.20;0.30;0.50;0.75;1.00;1.25;1.5;1.75;2.0;2.25;2.5;3.0!4
LINE	= 20//1/0           !30//1/0          ! 5/1/1/3 
TITLE	= 5// ~ RAP  01-HR TOTAL PCPN, MSLP|^ 01-HOURLY TOTAL PCPN, MSLP!0
SCALE	= 0 ! ! 
SKIP	= 0
FINT    = 0.01;0.10;0.20;0.30;0.5;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.5;3.0
FLINE   = 0;21-27;24;28-30;14;15;2;5
CTYPE	= f                !c                ! c  
HILO    =                  !                 !25;2////30;30/y 
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
#$GEMEXE/gpend

# Copy ps.plt to different name for ruc model
#mv ps.plt ps.plt_ruc
if (-e ruc.gif) then
 
  mv ruc.gif ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_3hr_total_precip_MSLP_f01.gif
  cp ruc.gif.001 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_3hr_total_precip_MSLP_f02.gif
  cp ruc.gif.002 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_3hr_total_precip_MSLP_f03.gif
  cp ruc.gif.003 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_3hr_total_precip_MSLP_f04.gif
  cp ruc.gif.004 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_3hr_total_precip_MSLP_f05.gif
  cp ruc.gif.005 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_3hr_total_precip_MSLP_f06.gif
  cp ruc.gif.006 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_3hr_total_precip_MSLP_f07.gif
  cp ruc.gif.007 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_3hr_total_precip_MSLP_f08.gif
  cp ruc.gif.008 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_3hr_total_precip_MSLP_f09.gif
  cp ruc.gif.009 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_3hr_total_precip_MSLP_f10.gif
  cp ruc.gif.010 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_3hr_total_precip_MSLP_f11.gif
  cp ruc.gif.011 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_3hr_total_precip_MSLP_f12.gif
  cp ruc.gif.012 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_3hr_total_precip_MSLP_f13.gif
  cp ruc.gif.013 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_3hr_total_precip_MSLP_f14.gif
  cp ruc.gif.014 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_3hr_total_precip_MSLP_f15.gif

  mv ruc.gif.002 ruc_11.gif
  mv ruc.gif.005 ruc_12.gif
  mv ruc.gif.008 ruc_13.gif
  mv ruc.gif.011 ruc_14.gif
  keep ruc_1[1-4].gif
  mv ruc_1[1-4].gif $WEBPIX/
  rm -f ruc.gif.???
endif
