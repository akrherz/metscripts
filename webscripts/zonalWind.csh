source ../COMMON.csh

setenv LOGFILE	logs/www_zw.log

set device="GF|zonalWind.gif|1024;768"
set grid=${MODEL}/gfs/${DATE}${1}_thin.gem

$GEMEXE/gdcross_gf << EOF > $LOGFILE
    DEVICE	= $device
    GDFILE	= $grid
    WIND	= bm5
    SCALE	= 0
    GVECT	= 
    GDATTIM	= f00
    GFUNC	= XAV(UREL)
    GVCORD   = PRES
    YAXIS	= 0:1000
    CINT 	= 5
    CTYPE	= c
    CXSTNS	= -89.;30.>89.;30.
    TITLE	= 31/-2/Zonal Wind (m/s) ~
    PTYPE	= LOG
    LINE	= 3/1/1
    BORDER	= 1/1/3
    CONTUR	= 1
    FINT	= 
    FLINE	= 
    TEXT	= 1/22/1/hw

    list
    run

    exit
EOF

if ( ! -f zonalWind.gif ) then
    exit
endif

cd $CURRENT
foreach num (7 6 5 4 3 2 1 0)
    mv zonalWind_${num}.gif zonalWind_`echo ${num} + 1 | bc`.gif
end

cd ~/projects/metscripts/webscripts

mv zonalWind.gif $CURRENT/zonalWind_0.gif
