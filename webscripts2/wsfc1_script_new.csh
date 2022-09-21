source ../COMMON.csh

setenv LOGFILE 	logs/www_sfc1.log

#
set grid=/data/gempak/surface/sao/${DATE}${1}_sao.gem
set grid1=file1.grd
#
# Run OAGRID to set up grid of sfc data
#
$GEMEXE/oagrid << EOF > $LOGFILE
GDFILE =                  $grid1
DELTAN =                  1.1
DELTAX =                  0.63
DELTAY =                  0.63
GRDAREA=                  15;-140;60;-50
EXTEND =                  2;2;2;2
DTAAREA=                  15;-140;60;-50
SOURCE =                  SF
SNFILE =                  /data/gempak/upperair/960429.gem
SFFILE =                  $grid
SNPARM =                  tmpc;hght;uwnd;vwnd
SFPARM =                  tmpc;dwpc;pmsl;uwnd;vwnd
DATTIM =                  ${date}/${hh}00
LEVELS =                  0
MAXGRD =                  200
list
run


exit
EOF
#
# Run OABSFC to objectively analyze surface data
#
$GEMEXE/oabsfc << EOF >> $LOGFILE
SFFILE  =                 $grid
GDFILE  =                 $grid1
SFPARM  =                 tmpc;dwpc;pmsl;uwnd;vwnd
DATTIM  =                 ${date}/${hh}00
DTAAREA =                 15;-140;60;-50
GUESS   =                  
GAMMA   =                 0.3
SEARCH  =                 20/EX
NPASS   =                 2
 GDATTIM  = ${date}/${hh}00
 GFUNC    = TMPC;DWPC;PMSL;UWND;VWND
 GLEVEL   = 0
 GVCORD   = NONE
list
run

exit
EOF

gpend

#
# Run GDPLOT and generate analyzed sfc temp
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid1
GDATTIM	= ${date}/${hh}00
PANEL	= 0
MAP      = 15/1/3
CLEAR	= yes
CLRBAR  = 31
PROJ     = lcc
LATLON   = 0
TEXT     = 1.0/2//hw
GAREA    = 18;-120;53;-59

DEVICE	= GF|sfc1_01.gif|720;540
GLEVEL   = 0
GVCORD   = none
SKIP     = /4/4
SCALE    = 
GFUNC    = tmpf
CTYPE    = c/f
CONTUR   = 
CINT     = 5
LINE     = 32/1/1
FINT     = 0;10;20;25;30;35;40;45;50;55;60;65;70;75;80;85;90;95;100;110
FLINE    = 28-16--1;14-8--1;28-16--1
HILO     = 
HLSYM    = 2;1.5//21//hw
CLRBAR   = 0
GVECT    = WND 
WIND     = bk32/1.0/2
REFVEC   = 
TITLE    = 31/-2/~ SURFACE TEMPERATURE (F) AND WINDS
SATFIL   = 
RADFIL   = 
STNPLT   = 
\$mapfil=
list
run

exit
EOF
#
# Run GPEND to clean up
#
if (-e sfc1_01.gif) then
  cp sfc1_01.gif ${ddir}${DATE2}/pix/sfc/temp_winds/${DATE}${hh}_temp_winds.gif
  mv sfc1_01.gif $WEBPIX/sfc1_01.gif
  keep $WEBPIX/sfc1_01.gif
endif

# Run GDPLOT and generate analyzed sfc dew point
#

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GLEVEL   = 0
DEVICE	= GF|sfc1_02.gif|720;540
GVCORD   = none
PANEL    = 0
SKIP     = /4/4
SCALE    = 
GFUNC    = dwpf
CTYPE    = c/f
CONTUR   = 
CINT     = 5
LINE     = 32/1/1
FINT     = -20;-10;-5;0;5;10;15;20;25;30;35;40;45;50;55;60;65;70;75;80;85;90
FLINE    = 28-16--1;14-4--1
HILO     = 
HLSYM    = 2;1.5//21//hw
CLRBAR   = 0
GVECT    = WND 
WIND     = bk32/1.0/2
REFVEC   = 
TITLE    = 31/-2/~ SURFACE DEW POINT (F) AND WINDS
SATFIL   = 
RADFIL   = 
PROJ     = lcc
LATLON   = 0
STNPLT   = 
list
run

exit
EOF
#
# Run GPEND to clean up
#
if (-e sfc1_02.gif) then
  cp sfc1_02.gif ${ddir}${DATE2}/pix/sfc/dewpoint_winds/${DATE}${hh}_dewpoint_winds.gif
  mv sfc1_02.gif $WEBPIX/sfc1_02.gif
  keep $WEBPIX/sfc1_02.gif
endif
# Run GDPLOT and generate analyzed sfc moist. divergence

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GLEVEL   = 0
DEVICE	= GF|sfc1_03.gif|720;540
GVCORD   = none
PANEL    = 0
SKIP     = /4/4
SCALE    = 7
GFUNC    = div((smul(mixr(dwpc,pmsl),wnd))
CTYPE    = c/f
CONTUR   = 
CINT     = -12;-8;-6;-4;-2;0;2;4;6;8 
LINE     = 32/1/1
FINT     = -12;-8;-6;-4;-2;0;2;4;6;8  
FLINE    = 15-18-1;21;22;23-27-1
HILO     = 
HLSYM    = 2;1.5//21//hw
CLRBAR   = 0
GVECT    = WND 
WIND     = bk32/1.0/2
REFVEC   = 
TITLE    = 31/-2/~ SURFACE MOISTURE DIVERGENCE
CLEAR    = yes
SATFIL   = 
RADFIL   = 
PROJ     = lcc
LATLON   = 0
STNPLT   = 
list
run

exit
EOF
#
# Run GPEND to clean up
#

if (-e sfc1_03.gif) then
  cp sfc1_03.gif ${ddir}${DATE2}/pix/sfc/moisture_divergence/${DATE}${hh}_moisture_divergence.gif
  mv sfc1_03.gif $WEBPIX/sfc1_03.gif
endif
# Run GDPLOT and generate sfc theta-E
#

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GLEVEL   = 0
DEVICE	= GF|sfc1_04.gif|720;540
GVCORD   = none
PANEL    = 0
SKIP     = /4/4
SCALE    = 
GFUNC    = thte(pmsl,tmpc,dwpc)
CTYPE    = c/f
CONTUR   = 
CINT     = 4
LINE     = 32/1/1
FINT     = 4  
FLINE    = 30-16--1;14-3--1
HILO     = 
HLSYM    = 2;1.5//21//hw
CLRBAR   = 0
GVECT    = WND 
WIND     = bk32/1.0/2
REFVEC   = 
TITLE    = 31/-2/~ SURFACE THETA-E (K)
CLEAR    = yes
SATFIL   = 
RADFIL   = 
PROJ     = lcc
LATLON   = 0
STNPLT   = 
list
run

exit
EOF

if (-e sfc1_04.gif) then
  cp sfc1_04.gif ${ddir}${DATE2}/pix/sfc/theta_e/${DATE}${hh}_theta_e.gif
  mv sfc1_04.gif $WEBPIX/sfc1_04.gif
endif

rm -f file1.grd
