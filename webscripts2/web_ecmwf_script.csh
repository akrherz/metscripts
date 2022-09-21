
source ../COMMON.csh

setenv LOGFILE	logs/www_ecm.log

set yest=`date -u --date '1 day ago' +'%Y%m%d'`
set yest1 = `date -u --date '1 day ago' +'%Y/%m/%d'`
#
set device="GF|ecm.gif"
set grid=${MODEL}/ecmwf/${yest}${1}_ecmf1.gem

#
$GEMEXE/gdplot_gf << EOF > $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f72-f168-24
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

GFUNC =  hght  !pmsl@0%NONE 
GLEVEL = 500   !0     !1000
GVECT =        !      ! wind@1000%PRES
WIND  =        !      ! Bk32/0.8/2 
GVCORD=  PRES            
PROJ  =   str/+90;-100;0/1;3;1;2  
GAREA =  10;-125;50;-20         
SKIP  =  0/0/1 
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
TITLE   = 31/-2/  ~  ECMWF 500mb HGHT, WIND (knts), MSL Press|^ 500mb HGHT WND & PMSL!0
\$mapfil = 
list
run

exit
EOF
#
# DON'T forget to run GPEND!
#
#$GEMEXE/gpend
#
# Move ps file and rename to ecm 
if (-e ecm.gif) then

cp ecm.gif ${ddir}/${yest1}/pix/ecm/ecm_${yest}${1}_500mb_heights_winds_MSLP_f72.gif
cp ecm.gif.001 ${ddir}/${yest1}/pix/ecm/ecm_${yest}${1}_500mb_heights_winds_MSLP_f96.gif
cp ecm.gif.002 ${ddir}/${yest1}/pix/ecm/ecm_${yest}${1}_500mb_heights_winds_MSLP_f120.gif
cp ecm.gif.003 ${ddir}/${yest1}/pix/ecm/ecm_${yest}${1}_500mb_heights_winds_MSLP_f144.gif
cp ecm.gif.004 ${ddir}/${yest1}/pix/ecm/ecm_${yest}${1}_500mb_heights_winds_MSLP_f168.gif

mv ecm.gif ecm_01.gif
mv ecm.gif.001 ecm_02.gif
mv ecm.gif.002 ecm_03.gif
mv ecm.gif.003 ecm_04.gif
mv ecm.gif.004 ecm_05.gif
keep ecm_0[1-5].gif
mv ecm_0[1-5].gif $WEBPIX/
endif
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f72-f168-24
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

GFUNC =  tmpc  
GLEVEL = 850   
GVECT =        
WIND  =        
GVCORD=  PRES            
PROJ  =   str/+90;-100;0/1;3;1;2  
GAREA =  10;-125;50;-20         
SKIP  =  0/0/1 
SCALE =  999
CTYPE =  c/f 
CINT  =  2
LINE  =  32/1/2/1 
FINT  =  -28;-24;-20;-16;-12;-8;-4;0;4;8;12;16;20;24;28;32
FLINE =  30-22--1;18-10--1!
HILO  =  
HLSYM =   
REFVEC=                 
STNPLT=  
TITLE   = 31/-2/  ~  ECMWF 850mb TMPC|^ 850mb TMPC
\$mapfil = 
list
run

exit
EOF
#
# DON'T forget to run GPEND!
#
#$GEMEXE/gpend
#
# Move ps file and rename to ecm 
if (-e ecm.gif) then

cp ecm.gif ${ddir}/${yest1}/pix/ecm/ecm_${yest}${1}_850mb_temps_f72.gif
cp ecm.gif.001 ${ddir}/${yest1}/pix/ecm/ecm_${yest}${1}_850mb_temps_f96.gif
cp ecm.gif.002 ${ddir}/${yest1}/pix/ecm/ecm_${yest}${1}_850mb_temps_f120.gif
cp ecm.gif.003 ${ddir}/${yest1}/pix/ecm/ecm_${yest}${1}_850mb_temps_f144.gif
cp ecm.gif.004 ${ddir}/${yest1}/pix/ecm/ecm_${yest}${1}_850mb_temps_f168.gif

mv ecm.gif ecm_06.gif
mv ecm.gif.001 ecm_07.gif
mv ecm.gif.002 ecm_08.gif
mv ecm.gif.003 ecm_09.gif
mv ecm.gif.004 ecm_10.gif
keep ecm_0[6-9].gif ecm_10.gif
mv ecm_0[6-9].gif ecm_10.gif $WEBPIX/
endif
