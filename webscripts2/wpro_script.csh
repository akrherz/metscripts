
source ../COMMON.csh

setenv LOGFILE 	logs/www_pro.log

set device="GIF|pro.gif"
set grid=/data/gempak/profiler/${DATE}${1}_pro.gem
#
# Run SNCROSS2 to generate time series of Slater profiler winds
#

sncross << EOF > $LOGFILE
\$RESPOND = YES
DEVICE	= $device 
CXSTNS   = slai4
SNPARM   =     
SNFILE   = $grid
DATTIM   = all
VCOORD   = hght
PTYPE    = lin
YAXIS    = 500/12000/1000
TAXIS    = 
LINE     = 31/1/1/1
BORDER   = 5
CINT     = 5
WIND     = bk30-7
TITLE    = 5/-4/ TODAY'S PROFILER WINDS FROM SLATER, IA
PANEL    = 0
CLEAR    = y
FILTER   = 0.7
TEXT     = 0.8/21/1/hw
CURVE    = 2
CLRBAR   = 0
CONTUR   = 3/3
FINT     = 
FLINE    = 
CTYPE    = c
list
run

exit
EOF

#
# Run GPEND to clean up
#
gpend
#

if (-e pro.gif) then
 # Rename ps file to indicate sfc data
 cp pro.gif ${ddir}${DATE2}/pix/pro/Slater_time_series_profile/${DATE}${hh}_time_series_profile.gif
 mv pro.gif $WEBPIX/pro_01.gif
 keep $WEBPIX/pro_01.gif
endif
