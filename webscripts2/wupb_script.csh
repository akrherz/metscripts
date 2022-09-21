#! /bin/csh 

source ~/projects/metscripts/COMMON.csh

setenv LOGFILE 	logs/www_uab
#
# Remove last upper grid file and upper ps plot
#
rm -f file2.grd
rm -f ps.plt_uab
rm -f uab_0?.gif >& /dev/null
#
# Set some variables for GDPLOT run
#
set device="GF"
set grid=/data/gempak/model/nam/${DATE}${1}_nam212.gem
#
# Run GDPLOT and generate analyzed 850,700 and 500 maps
#
$GEMEXE/gdplot_gf << EOF > $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f00
DEVICE	= GF|uab_01.gif|720;540
PANEL	= 0
TEXT	= 1/21//hw
CONTUR	= 1
MAP      = 15/1/2
CLEAR	= yes
CLRBAR  = 1

GAREA    = 15;-133;57;-49
PROJ     = lcc/35;-95;20
LATLON   = 0

GLEVEL   = 500
GVCORD   = pres
SKIP     = /6/6
SCALE    = 
GFUNC    = sm9s(tmpc)    !   sm9s(hght)
CTYPE    = c/f     !   c
CONTUR   = 
CINT     = 5       !   60
LINE     = 19/1/1   !  32/1/3
FINT     = 5
FLINE    = 25-22--1;18-16--1;14-10--1
HILO     = 
HLSYM    = 2;1.5//21//hw
CLRBAR   = 0
GVECT    = WND 
WIND     = bk32/0.9/1
REFVEC   = 
TITLE    = 31/-2/~ 500 MB HEIGHTS AND TEMPERATURES (C)
TEXT     = 1.0/2//hw
SATFIL   = 
RADFIL   = 
STNPLT   =  
\$mapfil =
list
run

exit
EOF

#
# Run GPEND to clean up
#
#disabled 2001.04.13 geff@iastate.edu
#$GEMEXE/gpend
#
# Rename ps plot to indicate upper air data
cp uab_01.gif ${ddir}${DATE2}/pix/ua/${DATE}${1}_500mb_heights_temps.gif
mv uab_01.gif $WEBPIX/uab_01.gif
keep $WEBPIX/uab_01.gif

# changed 2001.04.13 geff@iastate.edu
#$GEMEXE/gdplot << EOF >> $LOGFILE
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f00
DEVICE	= GF|uab_02.gif|720;540

GLEVEL   = 500
GVCORD   = pres
SKIP     = /8/8
SCALE    = 
GFUNC    = sm9s(sm9s(sm9s(avor(obs))))   !   sm9s(hght)
CTYPE    = c/f     !   c
CONTUR   = 
CINT     = 2       !   60
LINE     = 19/5/1   !   31/1/3
FINT     = 10;14;18;20;22;24;26;28;30
FLINE    = 0;24-22--1;18-16--1;14-4--1
HILO     = 
HLSYM    = 2;1.5//21//hw
CLRBAR   = 0
GVECT    = WND 
WIND     = bk31/1.1/1
REFVEC   = 
TITLE    = 31/-2/~ 500 MB HEIGHTS AND VORTICITY
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
#disabled 2001.04.13 geff@iastate.edu
#$GEMEXE/gpend
#
# Rename ps plot to indicate upper air data
cp uab_02.gif ${ddir}${DATE2}/pix/ua/${DATE}${1}_500mb_heights_vorticity.gif
mv uab_02.gif $WEBPIX/uab_02.gif
keep $WEBPIX/uab_02.gif
