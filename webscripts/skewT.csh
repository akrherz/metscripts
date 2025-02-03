
source ../COMMON.csh

setenv IMAGE skew_${2}_${1}.gif
rm -f $IMAGE
setenv DEVICE GF\|${IMAGE}\|720\;540

setenv DATA_DIR	/data/gempak/upperair

setenv OUTFILE1 $CURRENT/skew/skew${2}.gif

set grid=${DATA_DIR}/${DATE}_upa.gem

$GEMEXE/snprof_gf << EOF > logs/skewT_${1}_${2}.log
    SNFILE   = $grid
    DEVICE   = ${DEVICE}
    DATTIM   = ${DATE}/${1}
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

if (-e ${IMAGE} ) then
    mv ${IMAGE} ${OUTFILE1}
endif
