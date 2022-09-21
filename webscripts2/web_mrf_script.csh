#! /bin/csh  
# 19 Mar 2003	Make sure counties are not on maps...

source ../COMMON.csh

setenv LOGFILE	logs/www_mrf

#
set device="GF|mrf.gif"
set grid=/data/gempak/model/gfs/${DATE}${1}_gfs215.gem

$GEMEXE/gdplot_gf << EOF > $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f96-f240-24
DEVICE	= $device 
PANEL	= 0
TEXT	= 1.2/21//hw
CONTUR	= 1
MAP     = 31/1/1
CLEAR	= yes
CLRBAR  = 0

GAREA	= 17.529;-129.296;53.771;-22.374
PROJ	= str/90;-105;0
LATLON	= 0

GFUNC =  hght  ! pmsl@0%NONE 
GLEVEL = 500   !0     ! 1000
GVECT =        !      ! wind@1000%PRES
WIND  =        !      ! Bk32/0.8/2 
GVCORD=  PRES            
PROJ  =   str/+90;-100;0/1;3;1;2  
GAREA =  10;-125;50;-20         
SKIP  =  /5;5
SCALE =  999
CTYPE =  c/f ! c                               
CINT  =  60 ! 4
LINE  =  15/1/2/1 ! 32/1/2/1  
FINT  =  4800;4920;5040;5160;5280;5400;5520;5640;5760;5880;6000 !
FLINE =  30-22--1;18-10--1!
HILO  =  !25;2/H#;L#///30;30/y !
HLSYM =   
REFVEC=                 
STNPLT=  
TITLE   = 31/-2/  ~  MRF 500mb HGHT, WIND (knts), MSL Press|^ 500mb HGHT WND & PMSL!0
\$mapfil=
list
run

exit
EOF
#
# DON'T forget to run GPEND!
#
#$GEMEXE/gpend

#
# Move ps file and rename to mrf 
cp mrf.gif ${ddir2}/pix/mrf/mrf_${DATE}${1}_500mb_HGHT_winds_MSLP_f96.gif
cp mrf.gif.001 ${ddir2}/pix/mrf/mrf_${DATE}${1}_500mb_HGHT_winds_MSLP_f120.gif
cp mrf.gif.002 ${ddir2}/pix/mrf/mrf_${DATE}${1}_500mb_HGHT_winds_MSLP_f144.gif
cp mrf.gif.003 ${ddir2}/pix/mrf/mrf_${DATE}${1}_500mb_HGHT_winds_MSLP_f168.gif
cp mrf.gif.004 ${ddir2}/pix/mrf/mrf_${DATE}${1}_500mb_HGHT_winds_MSLP_f192.gif
cp mrf.gif.005 ${ddir2}/pix/mrf/mrf_${DATE}${1}_500mb_HGHT_winds_MSLP_f216.gif
cp mrf.gif.006 ${ddir2}/pix/mrf/mrf_${DATE}${1}_500mb_HGHT_winds_MSLP_f240.gif

mv mrf.gif mrf_01.gif
mv mrf.gif.001 mrf_02.gif
mv mrf.gif.002 mrf_03.gif
mv mrf.gif.003 mrf_04.gif
mv mrf.gif.004 mrf_05.gif
mv mrf.gif.005 mrf_06.gif
mv mrf.gif.006 mrf_07.gif
keep mrf_0[1-7].gif
mv mrf_0[1-7].gif $WEBPIX/
