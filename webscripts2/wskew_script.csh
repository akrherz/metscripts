#! /bin/csh 
# 05 Mar 2003	Check this out and see why she fails

source ~/projects/metscripts/COMMON.csh

setenv LOGFILE 	logs/www_skew

set grid=/data/gempak/upperair/${DATE}_upa.gem

$GEMEXE/snprof_gf << EOF > $LOGFILE
SNFILE   = $grid
DEVICE	= GF|skew_01.gif|720;540
DATTIM   = ${date}/${1}
AREA     = @oax
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
TITLE    = 5/-0/ SKEW-T FROM OMAHA, NE
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

# Rename ps file to indicate sfc data
cp skew_01.gif ${ddir}${DATE2}/pix/skew/${1}z/${DATE}${1}_skewt_OAX.gif
if (-e skew_01.gif) then
  mv skew_01.gif $WEBPIX/skew_01.gif
  keep $WEBPIX/skew_01.gif
endif

$GEMEXE/snprof_gf << EOF >> $LOGFILE
SNFILE   = $grid
DEVICE	= GF|skew_02.gif|720;540
AREA     = @dvn
SNPARM   = tmpc;dwpc
LINE     = 3
PTYPE    = skewt
VCOORD   = pres
STNDEX   = lift;swet;kinx;totl;cape;cins;brch
STNCOL   = 5
WIND     = bk27/.8/1//.5
WINPOS   = 1
MARKER   = 0
BORDER   = 15
TITLE    = 5/-0/ SKEW-T FROM DAVENPORT, IA
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
#$GEMEXE/gpend
#
# Rename ps file to indicate sfc data
cp skew_02.gif ${ddir}${DATE2}/pix/skew/${1}z/${DATE}${1}_skewt_DVN.gif
if (-e skew_02.gif) then
  mv skew_02.gif $WEBPIX/skew_02.gif
  keep $WEBPIX/skew_02.gif
endif
