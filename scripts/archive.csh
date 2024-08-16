#!/bin/csh
# 15 Jan 2003   Copy pals version of thin grid :)
# 03 Mar 2003   Also archive mos grids
#set echo

set dd=`date -u '--date=1 day ago' +%d`
set yyyy=`date -u '--date=1 day ago' +%Y`
set sday=`date -u '--date=1 day ago' +%y%m%d`
set day=`date -u '--date=1 day ago' +%Y%m%d`
set jday=`date -u '--date=1 day ago' +%Y%j`
set source=/data
set target=/data/archive/${day}.tar.gz

#        gempak/surface/snet/${day}_snet.gem \
#        gempak/surface/rwis/${day}_rwis.gem \

cd ${source}
tar cfz ${target} \
        text/Forecasts/Forecast*${dd} \
        text/Public/Public.${dd} \
        text/Severe/Severe.${dd} \
	gempak/nwx/pub_prod/LSR/${day}* \
        gempak/surface/sao/${day}_sao.gem \
        gempak/upperair/${day}_upa.gem \
        gempak/model/nam/${day}00_nam211.gem \
        gempak/model/nam/${day}12_nam211.gem \
        gempak/model/ruc/${day}00_ruc236.gem \
        gempak/model/ruc/${day}06_ruc236.gem \
        gempak/model/ruc/${day}12_ruc236.gem \
        gempak/model/ruc/${day}18_ruc236.gem \
        gempak/model/gfs/${day}00_thin.gem \
        gempak/model/gfs/${day}12_thin.gem \
        gempak/nldn/${day}*.gem \
        gempak/mos/${day}*.gem

set remotedir="/stage/DailyMetArchive/daily/$yyyy"
rsync -a --remove-source-files --rsync-path "mkdir -p $remotedir && rsync" $target meteor_ldm@akrherz-desktop.agron.iastate.edu:$remotedir
