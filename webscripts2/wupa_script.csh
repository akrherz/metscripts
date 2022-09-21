#! /bin/csh 

source ~/projects/metscripts/COMMON.csh
setenv LOGFILE 	logs/www_uaa.log
#
# Remove last upper grid file and upper ps plot
#
rm -f file4.grd
rm -f ps.plt_uaa
rm -f uaa_0?.gif >& /dev/null
#
# Set some variables for GDPLOT run
#
#set device="invgps|||C|P"
set device="GF"
set grid=/data/gempak/model/nam/${DATE}${1}_nam212.gem
#
# Run GDPLOT and generate analyzed 850,700 and 500 maps
#
# changed 2001.04.13 geff@iastate.edu
#$GEMEXE/gdplot << EOF >> $LOGFILE
$GEMEXE/gdplot_gf << EOF > $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f00
DEVICE	= GF|uaa_01.gif|720;540
PANEL	= 0
TEXT	= 1/21//hw
CONTUR	= 1
MAP      = 15/1/2
CLEAR	= yes
CLRBAR  = 1

GAREA    = 15;-133;57;-49
PROJ     = lcc/35;-95;20
LATLON   = 0

GLEVEL   = 850
GVCORD   = pres
SKIP     = /6/6
SCALE    = 
GFUNC    = sm9s(tmpc)    !   sm9s(hght)
CTYPE    = c/f     !   c
CONTUR   = 
CINT     = 5       !   30
LINE     = 19/1/1   !  32/1/3
FINT     = 5
FLINE    = 25-22--1;18-16--1;14-10--1
HILO     = 
HLSYM    = 2;1.5//21//hw
CLRBAR   = 0
GVECT    = WND 
WIND     = bk32/0.9/1
REFVEC   = 
TITLE    = 31/-2/~ 850 MB HEIGHTS AND TEMPERATURES (C)
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
cp uaa_01.gif ${ddir}${DATE2}/pix/ua/${DATE}${1}_850mb_heights_temps.gif
mv uaa_01.gif $WEBPIX/uaa_01.gif
keep $WEBPIX/uaa_01.gif

# changed 2001.04.13 geff@iastate.edu
#$GEMEXE/gdplot << EOF >> $LOGFILE
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f00
DEVICE	= GF|uaa_02.gif|720;540

GLEVEL   = 700
GVCORD   = pres
SKIP     = /6/6
SCALE    = 
GFUNC    = sm9s(tmpc)    !   sm9s(hght)
CTYPE    = c/f     !   c
CONTUR   = 
CINT     = 5       !   30
LINE     = 19/1/1   !  32/1/3
FINT     = 5
FLINE    = 25-22--1;18-16--1;14-10--1
HILO     = 
HLSYM    = 2;1.5//21//hw
CLRBAR   = 0
GVECT    = WND 
WIND     = bk32/0.9/1
REFVEC   = 
TITLE    = 31/-2/~ 700 MB HEIGHTS AND TEMPERATURES (C)
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
cp uaa_02.gif ${ddir}${DATE2}/pix/ua/${DATE}${1}_700mb_heights_temps.gif
mv uaa_02.gif $WEBPIX/uaa_02.gif
keep $WEBPIX/uaa_02.gif
