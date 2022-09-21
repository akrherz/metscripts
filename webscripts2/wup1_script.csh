#! /bin/csh 
#

source ~/projects/metscripts/COMMON.csh

setenv LOGFILE 	logs/www_ua1
#
# Remove last upper grid file and upper ps plot
#
rm -f file3.grd
rm -f ps.plt_ua1
rm -f ua1_0?.gif >& /dev/null
#
# Set some variables for GDPLOT run
#
set device="GF"
set grid=/data/gempak/model/nam/${DATE}${1}_nam212.gem
#
#
# Run GDPLOT and generate analyzed 300, 200 map
#
# changed 2001.04.13 geff@iastate.edu
#$GEMEXE/gdplot << EOF >> $LOGFILE
$GEMEXE/gdplot_gf << EOF > $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f00
DEVICE	= GF|ua1_01.gif|720;540
PANEL	= 0
TEXT	= 1/21//hw
CONTUR	= 1
MAP      = 15/1/2
CLEAR	= yes
CLRBAR  = 1

GAREA    = 15;-133;57;-49
PROJ     = lcc/35;-95;20
LATLON   = 0

GLEVEL   = 300
GVCORD   = pres
SKIP     = /6/6
SCALE    = 
GFUNC    = sm9s(sped)    !   sm9s(hght)
CTYPE    = c/f     !   c
CONTUR   = 
CINT     = 25;35;45;55;65;75;85;95      !   120
LINE     = 19/1/1   !   32/1/3
FINT     = 25;35;45;55;65;75;85;95
FLINE    = 27-21--3;18-16--2;14-4--2
HILO     = 
HLSYM    = 2;1.5//21//hw
CLRBAR   = 0
GVECT    = WND 
WIND     = bk32/0.9/1
REFVEC   = 
TITLE    = 31/-2/~ 300 MB HEIGHTS AND WIND SPEEDS (M/S)
TEXT     = 1.0/2//hw
SATFIL   = 
RADFIL   = 
STNPLT   =  
list
run

exit
EOF

#
# Run GPEND to clean up
#
# disabled 2001.04.13 geff@iastate.edu
#$GEMEXE/gpend
#
# Rename ps plot to indicate upper air data
cp ua1_01.gif ${ddir}${DATE2}/pix/ua/${DATE}${1}_300mb_heights_winds.gif
mv ua1_01.gif $WEBPIX/ua1_01.gif
keep $WEBPIX/ua1_01.gif

# changed 2001.04.13 geff@iastate.edu
#$GEMEXE/gdplot << EOF >> $LOGFILE
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f00
DEVICE	= GF|ua1_02.gif|720;540
GLEVEL   = 200
GVCORD   = pres
SKIP     = /6/6
SCALE    = 
GFUNC    = sm9s(sped)    !   sm9s(hght)
CTYPE    = c/f     !   c
CONTUR   = 
CINT     = 25;35;45;55;65;75;85;95      !   120
LINE     = 19/1/1   !   32/1/3
FINT     = 25;35;45;55;65;75;85;95
FLINE    = 27-21--3;18-16--2;14-4--2
HILO     = 
HLSYM    = 2;1.5//21//hw
CLRBAR   = 0
GVECT    = WND 
WIND     = bk32/0.9/1
REFVEC   = 
TITLE    = 31/-2/~ 200 MB HEIGHTS AND WIND SPEEDS (M/S)
TEXT     = 1.0/2//hw
SATFIL   = 
RADFIL   = 
STNPLT   =  
list
run

exit
EOF

#
# Run GPEND to clean up
#
# disabled 2001.04.13 geff@iastate.edu
#$GEMEXE/gpend
#
# Rename ps plot to indicate upper air data
cp ua1_02.gif ${ddir}${DATE2}/pix/ua/${DATE}${1}_200mb_heights_winds.gif
mv ua1_02.gif $WEBPIX/ua1_02.gif
keep $WEBPIX/ua1_02.gif
