#!/bin/csh 

source ../COMMON.csh
setenv LOGFILE 	logs/www_gfsq.log
#
#
set device="GF|gfsq.gif"
set grid=/data/gempak/model/gfs/${DATE}${1}_gfs215.gem

$GEMEXE/gdplot_gf << EOF > $LOGFILE
\$RESPOND = YES
GDFILE  = $grid
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

GLEVEL  = 600:700
GVCORD  = pres
GFUNC   = mul[1e15,sm9s(div(vasv(qvec(ldf(hght),sm5v(vlav(wnd))),kcrs(thrm(hght)))))]
GVECT   = smul[4e9,(vasv(qvec(ldf(hght),sm5v(vlav(wnd))),kcrs(thrm(hght))))]
WIND    = an32/.5/1//.3
SKIP    = /2;2
SCALE   = 0
CINT    = -60;-40;-30;-25;-20;-15;-10;-6;-4;-2;0;2;4;6;10;15;20;25;30;40;60
LINE    = 2/1/1/2  
TITLE   = 5/-2/ ~ GFS 600-700MB Fn-VECTOR DIVERGENCE |^ Fn-VECTOR DIV
FINT    = -60;-40;-30;-25;-20;-15;-10;-6;-4;-2;0;2;4;6;10;15;20;25;30;40;60
FLINE   = 0;30-16--1;14-10--1
CTYPE   = c/f
HILO    = 
STNPLT  =0 
\$mapfil=hipowo.gsf
list
run

exit
EOF

mkdir -p ${ddir2}/pix/gfs/${1}z
cp gfsq.gif ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_Fn_vector_divergence_600_700mb_f06.gif
cp gfsq.gif.001 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_Fn_vector_divergence_600_700mb_f12.gif
cp gfsq.gif.002 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_Fn_vector_divergence_600_700mb_f18.gif
cp gfsq.gif.003 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_Fn_vector_divergence_600_700mb_f24.gif
cp gfsq.gif.004 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_Fn_vector_divergence_600_700mb_f30.gif
cp gfsq.gif.005 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_Fn_vector_divergence_600_700mb_f36.gif
cp gfsq.gif.006 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_Fn_vector_divergence_600_700mb_f42.gif
cp gfsq.gif.007 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_Fn_vector_divergence_600_700mb_f48.gif
cp gfsq.gif.008 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_Fn_vector_divergence_600_700mb_f54.gif
cp gfsq.gif.009 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_Fn_vector_divergence_600_700mb_f60.gif

mv gfsq.gif gfsq_01.gif
mv gfsq.gif.001 gfsq_02.gif
mv gfsq.gif.002 gfsq_03.gif
mv gfsq.gif.003 gfsq_04.gif
mv gfsq.gif.004 gfsq_05.gif
mv gfsq.gif.005 gfsq_06.gif
mv gfsq.gif.006 gfsq_07.gif
mv gfsq.gif.007 gfsq_08.gif
mv gfsq.gif.008 gfsq_09.gif
mv gfsq.gif.009 gfsq_10.gif
keep gfsq_0[1-9].gif gfsq_10.gif 
mv gfsq_0[1-9].gif gfsq_10.gif $WEBPIX/
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE  = $grid
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

GLEVEL  = 700:850
GVCORD  = pres
GFUNC   = mul[1e15,sm9s(div(vasv(qvec(ldf(hght),sm5v(vlav(wnd))),kcrs(thrm(hght)))))]
GVECT   = smul[4e9,(vasv(qvec(ldf(hght),sm5v(vlav(wnd))),kcrs(thrm(hght))))]
WIND    = an32/.5/1//.3
SKIP    = /2;2
SCALE   = 
CINT    = -60;-40;-30;-25;-20;-15;-10;-6;-4;-2;0;2;4;6;10;15;20;25;30;40;60
LINE    = 2/1/1/2  
TITLE   = 5/-2/ ~ ETA 700-850MB Fn-VECTOR DIVERGENCE |^ Fn-VECTOR DIV
FINT    = -60;-40;-30;-25;-20;-15;-10;-6;-4;-2;0;2;4;6;10;15;20;25;30;40;60
FLINE   = 0;30-16--1;14-10--1
CTYPE   = c/f
HILO    = 
STNPLT  =0 
\$mapfil=hipowo.gsf
list
run

exit
EOF

cp gfsq.gif ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_Fn_vector_divergence_700_850mb_f06.gif
cp gfsq.gif.001 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_Fn_vector_divergence_700_850mb_f12.gif
cp gfsq.gif.002 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_Fn_vector_divergence_700_850mb_f18.gif
cp gfsq.gif.003 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_Fn_vector_divergence_700_850mb_f24.gif
cp gfsq.gif.004 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_Fn_vector_divergence_700_850mb_f30.gif
cp gfsq.gif.005 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_Fn_vector_divergence_700_850mb_f36.gif
cp gfsq.gif.006 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_Fn_vector_divergence_700_850mb_f42.gif
cp gfsq.gif.007 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_Fn_vector_divergence_700_850mb_f48.gif
cp gfsq.gif.008 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_Fn_vector_divergence_700_850mb_f54.gif
cp gfsq.gif.009 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_Fn_vector_divergence_700_850mb_f60.gif

mv gfsq.gif gfsq_11.gif
mv gfsq.gif.001 gfsq_12.gif
mv gfsq.gif.002 gfsq_13.gif
mv gfsq.gif.003 gfsq_14.gif
mv gfsq.gif.004 gfsq_15.gif
mv gfsq.gif.005 gfsq_16.gif
mv gfsq.gif.006 gfsq_17.gif
mv gfsq.gif.007 gfsq_18.gif
mv gfsq.gif.008 gfsq_19.gif
mv gfsq.gif.009 gfsq_20.gif
keep gfsq_1[1-9].gif gfsq_20.gif 
mv gfsq_1[1-9].gif gfsq_20.gif $WEBPIX/
