
source ../COMMON.csh

setenv DATA_DIR	/data/gempak/surface
setenv LOGFILE 	logs/www_sfc1.log
setenv OUTPUT0 surfaceTemp.gif
setenv OUTPUT05 MWsurfaceTemp.gif
setenv OUTPUT1 surfaceDewp.gif
setenv OUTPUT15 MWsurfaceDewp.gif
setenv OUTPUT2 surfaceMois.gif
setenv OUTPUT25 MWsurfaceMois.gif
setenv OUTPUT3 surfaceThek.gif
setenv OUTPUT35 MWsurfaceThek.gif

set device="GF|${OUTPUT0}|720;540"

set grid=${DATA_DIR}/${DATE}${1}_sao.gem
set grid1=file1.grd

$GEMEXE/oagrid << EOF > $LOGFILE
    GDFILE = $grid1
    DELTAN =                  1.1
    DELTAX = 0.63
    DELTAY = 0.63
    GRDAREA= 15;-140;60;-50
    EXTEND = 2;2;2;2
    DTAAREA= 15;-140;60;-50
    SOURCE = SF
    SNFILE = 
    SFFILE = $grid
    SNPARM = 
    SFPARM = tmpc;dwpc;pmsl;uwnd;vwnd
    DATTIM = ${date}/${hh}00
    LEVELS = 0
    MAXGRD = 200
    list
    run

    exit
EOF

#gpend

#
# Run OABSFC to objectively analyze surface data
#
$GEMEXE/oabsfc << EOF >> $LOGFILE
    SFFILE  = $grid
    GDFILE  = $grid1
    SFPARM  = tmpc;dwpc;pmsl;uwnd;vwnd
    DATTIM  = ${date}/${hh}00
    DTAAREA = 15;-140;60;-50
    GUESS   =                  
    GAMMA   = 0.3
    SEARCH  = 20/EX
    NPASS   = 2
 GDATTIM  = ${date}/${hh}00
 GFUNC    = tmpc;dwpc;pmsl;uwnd;vwnd
 GLEVEL   = 0
 GVCORD   = NONE
    list
    run

    exit
EOF

gpend

# Surface Temps and Winds for US

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
    GDFILE	= $grid1
    GDATTIM	= ${date}/${hh}00
    PANEL	= 0
    MAP      = 15/1/2
    CLEAR	= yes
    CLRBAR  = 31
    PROJ     = lcc
    LATLON   = 0
    TEXT     = 1.0/2//hw
    GAREA    = 18;-120;53;-59

    DEVICE	= GF|${OUTPUT0}|720;540
    GLEVEL   = 0
    GVCORD   = none
    SKIP     = /4/4
    SCALE    = 
    GFUNC    = tmpf
    CTYPE    = c/f
    CONTUR   = 
    CINT     = 5
    LINE     = 32/1/1
    FINT     = 5
    FLINE    = 28-16--1;14-11--1
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
    list
    run

    exit
EOF

# Surface Temps and Winds for MidWest

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
    GDFILE	= $grid1
    GDATTIM	= ${date}/${hh}00
    PANEL	= 0
    MAP      = 15/1/2
    CLEAR	= yes
    CLRBAR  = 31
    PROJ     = lcc
    LATLON   = 0
    TEXT     = 1.0/2//hw
    GAREA    = 37;-101;46;-87

    DEVICE	= GF|${OUTPUT05}|720;540
    GLEVEL   = 0
    GVCORD   = none
    SKIP     = /1/1
    SCALE    = 
    GFUNC    = tmpf
    CTYPE    = c/f
    CONTUR   = 
    CINT     = 5
    LINE     = 32/1/1
    FINT     = 5
    FLINE    = 28-16--1;14-11--1
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
    list
    run

    exit
EOF



# US Dew Points

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
    GLEVEL   = 0
    DEVICE	= GF|${OUTPUT1}|720;540
    GDATTIM	= ${date}/${hh}00
    GAREA    = 18;-120;53;-59
    GVCORD   = none
    PANEL    = 0
    SKIP     = /4/4
    SCALE    = 
    GFUNC    = dwpf
    CTYPE    = c/f
    CONTUR   = 
    CINT     = 5
    LINE     = 32/1/1
    FINT     = 5
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

# Mid West Dew Points

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
    GLEVEL   = 0
    DEVICE	= GF|${OUTPUT15}|720;540
    GDATTIM	= ${date}/${hh}00
    GAREA    = 37;-101;46;-87
    GVCORD   = none
    PANEL    = 0
    SKIP     = /1/1
    SCALE    = 
    GFUNC    = dwpf
    CTYPE    = c/f
    CONTUR   = 
    CINT     = 5
    LINE     = 32/1/1
    FINT     = 5
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



# US Moisture Divergence

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
    GLEVEL   = 0
    DEVICE	= GF|${OUTPUT2}|720;540
    GAREA    = 18;-120;53;-59
    GVCORD   = none
    PANEL    = 0
    SKIP     = /4/4
    SCALE    = 
    GFUNC    = div((smul(mixr(dwpc,pmsl),wnd)))
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

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
    GLEVEL   = 0
    DEVICE	= GF|${OUTPUT25}|720;540
    GDATTIM	= ${date}/${hh}00
    GAREA    = 37;-101;46;-87
    GVCORD   = none
    PANEL    = 0
    SKIP     = /1/1
    SCALE    = 
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


# US Theta-E

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
    GLEVEL   = 0
    DEVICE	= GF|${OUTPUT3}|720;540
    GDATTIM	= ${date}/${hh}00
    GAREA    = 18;-120;53;-59
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



# Mid West Theta-E

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
    GLEVEL   = 0
    DEVICE	= GF|${OUTPUT35}|720;540
    GDATTIM	= ${date}/${hh}00
    GAREA    = 37;-101;46;-87
    GVCORD   = none
    PANEL    = 0
    SKIP     = /1/1
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


cd $CURRENT

foreach num (4 3 2 1)
 mv ${num}${OUTPUT0} `echo ${num} + 1 | bc`${OUTPUT0}
 mv ${num}${OUTPUT05} `echo ${num} + 1 | bc`${OUTPUT05}
 mv ${num}${OUTPUT1} `echo ${num} + 1 | bc`${OUTPUT1}
 mv ${num}${OUTPUT15} `echo ${num} + 1 | bc`${OUTPUT15}
 mv ${num}${OUTPUT2} `echo ${num} + 1 | bc`${OUTPUT2}
 mv ${num}${OUTPUT25} `echo ${num} + 1 | bc`${OUTPUT25}
 mv ${num}${OUTPUT3} `echo ${num} + 1 | bc`${OUTPUT3}
 mv ${num}${OUTPUT35} `echo ${num} + 1 | bc`${OUTPUT35}
end

mv ${OUTPUT0}  1${OUTPUT0}
mv ${OUTPUT05} 1${OUTPUT05}
mv ${OUTPUT1}  1${OUTPUT1}
mv ${OUTPUT15} 1${OUTPUT15}
mv ${OUTPUT2}  1${OUTPUT2}
mv ${OUTPUT25} 1${OUTPUT25}
mv ${OUTPUT3}  1${OUTPUT3}
mv ${OUTPUT35} 1${OUTPUT35}

cd ~/projects/metscripts/webscripts

mv ${OUTPUT0} $CURRENT/
mv ${OUTPUT05} $CURRENT/
mv ${OUTPUT1} $CURRENT
mv ${OUTPUT15} $CURRENT/
mv ${OUTPUT2} $CURRENT/
mv ${OUTPUT25} $CURRENT/
mv ${OUTPUT3} $CURRENT/
mv ${OUTPUT35} $CURRENT/

rm -f file1.grd
