source ../COMMON.csh
setenv TARGET $WEBPIX/skew
setenv IMAGE skew_${2}_${1}.gif
setenv DEVICE GF\|${IMAGE}\|720\;540
#
set yy=`date -u +%Y`
set mm=`date -u +%m`
set dd=`date -u +%d`
set date=${yy}${mm}${dd}
#
# Set up local variables
#
# DATA_DIR=GEMPAK surface data directory;
# LOGFILE=file to catch GEMPAK program output
#
setenv DATA_DIR	/data/gempak/upperair
setenv LOGFILE 	logs/www_skew_${1}_${2}.log
#
set grid=${DATA_DIR}/${date}_upa.gem
#
# Run SNPROF to generate skew-Ts
#
# changed 2001.04.13 geff@iastate.edu
#$GEMEXE/snprof << EOF >> $LOGFILE
$GEMEXE/snprof_gf << EOF > $LOGFILE
SNFILE   = $grid
DEVICE   = ${DEVICE}
DATTIM   = ${date}/${1}
AREA     = @${2}
SNPARM   = tmpc;dwpc
LINE     = 3
PTYPE    = skewt
VCOORD   = pres
STNDEX   = lift;swet;kinx;totl;cape;cins;brch
STNCOL   = 5
WIND     = bk27/.8/1//.5
WINPOS   = 1
MARKER   = 0
BORDER   = 31
TITLE    = 5/-0/ Skew-T from ${3}
YAXIS    = 1020/100//1;1;0
XAXIS    = -40/40/10/1;1;0
FILTER   = no
CLEAR    = yes
PANEL    = 0
TEXT     = 0.8/2//hw
THTALN   = 4/1/1
THTELN   = 4/2/1
MIXRLN   = 2/2/1
list
run

exit

EOF

#
# Run GPEND to clean up
#
# disabled 2001.04.13 geff@iastate.edu
#$GEMEXE/gpend

# archive the image we just created
if (-e ${IMAGE}) then
	cp $IMAGE $TARGET/$IMAGE
	keep ${IMAGE}
	rm $IMAGE
endif
