source ../COMMON.csh

setenv LOGFILE	logs/www_hemis.log

set device="GIF|hemis500n.gif|1280;1024"
set grid=${MODEL}/gfs/${DATE}${1}_thin.gem

gdplot << EOF > $LOGFILE

    GDFILE	= $grid
    GDATTIM	= $date/f00
    GLEVEL   = 500
    GVCORD   = PRES
     PANEL    = 0/1/1/3
     SKIP     = /2;2
     SCALE    = 0
     GFUNC    = hght
    CTYPE	 = c/f
    CONTUR   = 1
    CINT	 = 60
    FLINE	 = 30-17--1
    FINT	 = 4800;4920;5040;5100;5160;5220;5280;5340;5400;5460;5520;5580;5640
    LINE	 = 32/1/1
    HILO	 =
    HLSYM	 = 2;1/3/2//HW
    CLRBAR   = 0
    GVECT	 =
    WIND	 = 
    REFVEC   =
    TITLE   = 31/-2/~ 500 mb HGHT
    TEXT	 = 1.2/21/1/HW
    CLEAR	 = yes
    GAREA	 = 10;-100;10;-100
    PROJ	 = NPS
    MAP	 = 1/1/2
    LATLON   = 1
    DEVICE   = $device
    STNPLT   =
    SATFIL   = /data/mcidas/AREA02\03\;04;05;06
    RADFIL   = 
    LUTFIL   =

    list
    run

    exit
EOF


gdplot << EOF >> $LOGFILE
    FLINE	 = 0;16-10--1
    FINT	 = 5640;5700;5760;5820;5880;5940
    CLEAR    = no
    list
    run
    
    exit
EOF
#
# DON'T forget to run GPEND!
#
$GEMEXE/gpend
#



set device="GIF|hemis500s.gif"

gdplot << EOF >> $LOGFILE

    GDFILE	= $grid
    GDATTIM	= $date/f00
    GLEVEL   = 500
    GVCORD   = PRES
     PANEL    = 0/1/1/3
     SKIP     = /2;2
     SCALE    = 0
     GFUNC    = hght
    CTYPE	 = c/f
    CONTUR   = 1
    CINT	 = 60
    LINE	 = 32/1/1
    FLINE	 = 30-17--1
    FINT	 = 4800;4920;5040;5100;5160;5220;5280;5340;5400;5460;5520;5580;5640
    HILO	 =
    HLSYM	 = 2;1/3/2//HW
    CLRBAR   = 0
    GVECT	 =
    WIND	 = 
    REFVEC   =
    TITLE   = 31/-2/~ 500 mb HGHT
    TEXT	 = 1.2/21/1/HW
    CLEAR	 = yes
    GAREA	 = -10;-100;-10;-100
    PROJ	 = sps
    MAP	 = 1/1/2
    LATLON   = 1
    DEVICE   = $device
    STNPLT   =
    SATFIL   = /data/mcidas/AREA02\03\;04;05;06
    RADFIL   = 
    LUTFIL   =

    list
    run

    exit
EOF

$GEMEXE/gdplot << EOF >> $LOGFILE
    FLINE	 = 0;16-10--1
    FINT	 = 5640;5700;5760;5820;5880;5940
    CLEAR    = no
    list
    run
    
    exit
EOF

#
# DON'T forget to run GPEND!
#
$GEMEXE/gpend

cd $CURRENT
foreach num (7 6 5 4 3 2 1 0)
    mv hemis500n_${num}.gif hemis500n_`echo ${num} + 1 | bc`.gif
    mv hemis500s_${num}.gif hemis500s_`echo ${num} + 1 | bc`.gif
end

cd ~/projects/metscripts/webscripts/

mv hemis500n.gif $CURRENT/hemis500n_0.gif
mv hemis500s.gif $CURRENT/hemis500s_0.gif
