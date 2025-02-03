
source ../COMMON.csh

setenv LOGFILE  logs/www_advl.log

set grid=${MODEL}/nam/${DATE}${1}_nam212.gem

$GEMEXE/gdplot_gf << EOF > $LOGFILE
    GDFILE  = $grid
    GDATTIM = f00
    DEVICE  = GF|advL.gif|720;540
    PANEL   = 0
    TEXT    = 1/21//hw
    CONTUR  = 1
    MAP      = 25/1/1
    CLEAR   = yes
    GAREA    = 20;-123;51;-62
    PROJ     = lcc/35;-95;20
    LATLON   = 0
    CLRBAR = 25

    GVCORD   = pres !pres
    SCALE    = 0 !
    SKIP	= !/4;4
    GFUNC = STAB(tmpc) 
    GLEVEL   = 850:500 !700
    GVECT   =  !WND
    CTYPE    = f
    FINT     = 0.5  
    FLINE     = 14-19;21-24;26-30
    LINE = !32
    WIND = BK32

    REFVEC   = 
    TITLE    = 31/-1/~ 850-500mb Lapse Rates (K/km), 700mb winds
    TEXT     = 1.0/2//hw
    SATFIL   = 
    RADFIL   = 
    STNPLT   =

    list
    run

    exit
EOF

mv advL.gif $CURRENT
