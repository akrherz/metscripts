
source ../COMMON.csh

setenv LOGFILE 	logs/www_etaq.log

#
# Set some variables for GDPLOT run
#
set device="GF|etaq.gif"
set grid=/data/gempak/model/nam/${DATE}${1}_nam211.gem

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
TITLE   = 5/-2/ ~ ETA 600-700MB Fn-VECTOR DIVERGENCE |^ Fn-VECTOR DIV
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

cp etaq.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_Fn_vector_divergence_600_700mb_f06.gif
cp etaq.gif.001 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_Fn_vector_divergence_600_700mb_f12.gif
cp etaq.gif.002 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_Fn_vector_divergence_600_700mb_f18.gif
cp etaq.gif.003 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_Fn_vector_divergence_600_700mb_f24.gif
cp etaq.gif.004 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_Fn_vector_divergence_600_700mb_f30.gif
cp etaq.gif.005 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_Fn_vector_divergence_600_700mb_f36.gif
cp etaq.gif.006 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_Fn_vector_divergence_600_700mb_f42.gif
cp etaq.gif.007 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_Fn_vector_divergence_600_700mb_f48.gif
cp etaq.gif.008 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_Fn_vector_divergence_600_700mb_f54.gif
cp etaq.gif.009 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_Fn_vector_divergence_600_700mb_f60.gif

mv etaq.gif etaq_01.gif
mv etaq.gif.001 etaq_02.gif
mv etaq.gif.002 etaq_03.gif
mv etaq.gif.003 etaq_04.gif
mv etaq.gif.004 etaq_05.gif
mv etaq.gif.005 etaq_06.gif
mv etaq.gif.006 etaq_07.gif
mv etaq.gif.007 etaq_08.gif
mv etaq.gif.008 etaq_09.gif
mv etaq.gif.009 etaq_10.gif
keep etaq_0[1-9].gif etaq_10.gif 
mv etaq_0[1-9].gif etaq_10.gif $WEBPIX/
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

cp etaq.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_Fn_vector_divergence_700_850mb_f06.gif
cp etaq.gif.001 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_Fn_vector_divergence_700_850mb_f12.gif
cp etaq.gif.002 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_Fn_vector_divergence_700_850mb_f18.gif
cp etaq.gif.003 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_Fn_vector_divergence_700_850mb_f24.gif
cp etaq.gif.004 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_Fn_vector_divergence_700_850mb_f30.gif
cp etaq.gif.005 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_Fn_vector_divergence_700_850mb_f36.gif
cp etaq.gif.006 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_Fn_vector_divergence_700_850mb_f42.gif
cp etaq.gif.007 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_Fn_vector_divergence_700_850mb_f48.gif
cp etaq.gif.008 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_Fn_vector_divergence_700_850mb_f54.gif
cp etaq.gif.009 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_Fn_vector_divergence_700_850mb_f60.gif

mv etaq.gif etaq_11.gif
mv etaq.gif.001 etaq_12.gif
mv etaq.gif.002 etaq_13.gif
mv etaq.gif.003 etaq_14.gif
mv etaq.gif.004 etaq_15.gif
mv etaq.gif.005 etaq_16.gif
mv etaq.gif.006 etaq_17.gif
mv etaq.gif.007 etaq_18.gif
mv etaq.gif.008 etaq_19.gif
mv etaq.gif.009 etaq_20.gif
keep etaq_1[1-9].gif etaq_20.gif 
mv etaq_1[1-9].gif etaq_20.gif $WEBPIX/
