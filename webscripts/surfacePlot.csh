source ../COMMON.csh

setenv OUTPUT0 surfacePlot.gif
setenv OUTPUT05 MWsurfacePlot.gif

setenv DATA_DIR	/data/gempak/surface/
setenv LOGFILE 	logs/www_sfc2.log

set grid=${DATA_DIR}/${DATE}${1}_sao.gem


$GEMEXE/sfmap_gf << EOF > $LOGFILE
	\$RESPOND = YES
	DEVICE	= GF|${OUTPUT0}|720;540
	AREA     = 20;-128;53;-54
	GAREA    = 20;-116;51;-62
	SATFIL   = 
	RADFIL   = 
	STNPLT  =  
	SFPARM   = skyc:0.65;tmpf;wsym:0.65;rmsl;;dwpf;brbk:0.65
	DATTIM   = ${date}/${hh}00
	SFFILE   = $grid
	COLORS   = 31;5;5;6;3;31
	MAP      = 25/1/1
	LATLON   = 0
	MARKER   = 0
	TITLE    = 31/-2/~  SURFACE DATA
	CLEAR    = yes
	PANEL    = 0
	PROJ     = lcc
	FILTER   = 0.8
	TEXT     = 1/21/2/hw
	SKPMIS   = NO
	list
	run

	exit
EOF


$GEMEXE/sfmap_gf << EOF >> $LOGFILE
	DEVICE	= GF|${OUTPUT05}|720;540
	AREA    = 37;-101;44;-87
	GAREA    = 37;-101;44;-87
	SATFIL   = 
	RADFIL   = 
	STNPLT  =  
	SFPARM   = skyc:0.65;tmpf;wsym:0.65;rmsl;;dwpf;brbk:0.65
	DATTIM   = ${date}/${hh}00
	SFFILE   = $grid
	COLORS   = 31;5;5;6;3;31
	MAP      = 25/1/1
	LATLON   = 0
	MARKER   = 0
	TITLE    = 31/-2/~  SURFACE DATA
	CLEAR    = yes
	PANEL    = 0
	PROJ     = lcc
	FILTER   = 0.8
	TEXT     = 1/21/2/hw
	SKPMIS   = NO
	list
	run

	exit
EOF


cd $CURRENT

foreach num (4 3 2 1)
    mv ${num}${OUTPUT0} `echo ${num} + 1 | bc`${OUTPUT0}
    mv ${num}${OUTPUT05} `echo ${num} + 1 | bc`${OUTPUT05}
end

mv ${OUTPUT0}  1${OUTPUT0}
mv ${OUTPUT05} 1${OUTPUT05}

cd ~/projects/metscripts/webscripts/

mv ${OUTPUT0} $CURRENT/
mv ${OUTPUT05} $CURRENT/
