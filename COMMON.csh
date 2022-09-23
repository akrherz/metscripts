# An attempt at centralizing what the various scripts need :(

source /home/gempak/NAWIPS/Gemenviron

# Reset the MODEL variable
setenv MODEL /data/gempak/model

setenv CURRENT /home/www/meteor/html/wx/data/current/
setenv WEBPIX /home/www/meteor/html/pix

setenv DISPLAY :1

set ddir = "/mnt/mtarchive/data/"

set yy=`date -u +%y`
set yyyy=`date -u +%Y`
set mm=`date -u +%m`
set dd=`date -u +%d`
set date=${yy}${mm}${dd}
set DATE=`date -u +%Y%m%d`
set DATE2 = `date -u +%Y/%m/%d`
set hh=`date -u +%H`
set ddir2 = ${ddir}${DATE2}
setenv TIMESTAMP ${yy}${mm}${dd}${hh}
