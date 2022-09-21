source ../COMMON.csh
setenv LOGFILE 	logs/www_ruc1a.log

set device="GF|ruc1a.gif"
set grid=/data/gempak/model/rap/${DATE}${1}_rap236.gem

$GEMEXE/gdplot_gf << EOF > $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f00-f03-03
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

# Copy ps.plt to different name for ruc model
if (-e ruc1a.gif) then

  cp ruc1a.gif ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_MSLP_thickness_f00.gif
  cp ruc1a.gif.001 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_MSLP_thickness_f03.gif

  mv ruc1a.gif ruc1a_01.gif
  mv ruc1a.gif.001 ruc1a_02.gif
  keep ruc1a_0[1-2].gif
  mv ruc1a_0[1-2].gif $WEBPIX/
endif
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

if (-e ruc1a.gif) then
 
  cp ruc1a.gif ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_500mb_heights_vort_f00.gif
  cp ruc1a.gif.001 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_500mb_heights_vort_f03.gif

  mv ruc1a.gif ruc1a_03.gif
  mv ruc1a.gif.001 ruc1a_04.gif
  keep ruc1a_0[3-4].gif 
  mv ruc1a_0[3-4].gif $WEBPIX/
endif

# Run GDPLOT and generate ETA model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f01-f03-01
GLEVEL	= 0 ! 0 ! 0 !700
GVCORD	= NONE !NONE  !   none  
GFUNC	= (quo(p01m,25.4)) !(quo(p01m,25.4)) ! mmsl@0%none 
GVECT	=
CINT	= /.1/.1!0.10;0.20;0.30;0.50;0.75;1.00;1.25;1.5;1.75;2.0;2.25;2.5;3.0!4
LINE	= 20//1/0           !30//1/0          ! 5/1/1/3 
TITLE	= 5// ~ RAP  01-HR TOTAL PCPN, MSLP|^ 01-HOURLY TOTAL PCPN, MSLP!0
SCALE	= 0 !0!0
SKIP	= 0
FINT    = 0.01;0.05;0.10;0.15;0.25;0.35;0.5;0.75;1.0;1.25;1.5;1.75;2.0;3.0
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

if (-e ruc1a.gif) then
 
  cp ruc1a.gif ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_1hr_total_precip_MSLP_f00.gif
  cp ruc1a.gif.001 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_1hr_total_precip_MSLP_f03.gif
 
  mv ruc1a.gif ruc1a_05.gif
  mv ruc1a.gif.001 ruc1a_05a.gif
  mv ruc1a.gif.002 ruc1a_05b.gif
  keep ruc1a_05.gif
  keep ruc1a_05a.gif
  keep ruc1a_05b.gif
  mv ruc1a_05.gif $WEBPIX/
  mv ruc1a_05a.gif $WEBPIX/
  mv ruc1a_05b.gif $WEBPIX/
endif
