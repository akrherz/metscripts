
source ../COMMON.csh
set date2=`date -u --date "${1} days ago" +'%Y%m%d'`
set date1=`date -u --date "${1} days ago" +'%Y/%m/%d'`

cp /data/gempak/mos/${date2}00_gmos.gem ${ddir}/${date1}/gempak/mos/${date2}00_gmos.gem
cp /data/gempak/mos/${date2}12_gmos.gem ${ddir}/${date1}/gempak/mos/${date2}12_gmos.gem

cp /data/gempak/model/nam/${date2}00_nam212.gem ${ddir}/${date1}/gempak/model/${date2}00_nam212.gem
cp /data/gempak/model/nam/${date2}12_nam212.gem ${ddir}/${date1}/gempak/model/${date2}12_nam212.gem
cp /data/gempak/model/nam/${date2}00_nam211.gem ${ddir}/${date1}/gempak/model/${date2}00_nam211.gem
cp /data/gempak/model/nam/${date2}12_nam211.gem ${ddir}/${date1}/gempak/model/${date2}12_nam211.gem

cp /data/gempak/surface/${date2}_sao.gem ${ddir}/${date1}/gempak/surface/sao/${date2}_sao.gem
cp /data/gempak/upperair/${date2}_upa.gem ${ddir}/${date1}/gempak/upperair/${date2}_upa.gem
 
cp /data/gempak/model/ruc/${date2}00_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}00_ruc130.gem
cp /data/gempak/model/ruc/${date2}03_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}03_ruc130.gem
cp /data/gempak/model/ruc/${date2}06_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}06_ruc130.gem
cp /data/gempak/model/ruc/${date2}09_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}09_ruc130.gem
cp /data/gempak/model/ruc/${date2}12_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}12_ruc130.gem
cp /data/gempak/model/ruc/${date2}15_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}15_ruc130.gem
cp /data/gempak/model/ruc/${date2}18_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}18_ruc130.gem
cp /data/gempak/model/ruc/${date2}21_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}21_ruc130.gem

cp /data/gempak/model/gfs/${date2}00_gfs215.gem ${ddir}/${date1}/gempak/model/${date2}00_gfs215.gem
cp /data/gempak/model/gfs/${date2}12_gfs215.gem ${ddir}/${date1}/gempak/model/${date2}12_gfs215.gem

cp /data/gempak/model/gfs/${date2}00_thin.gem ${ddir}/${date1}/gempak/model/${date2}00_thin.gem
cp /data/gempak/model/gfs/${date2}12_thin.gem ${ddir}/${date1}/gempak/model/${date2}12_thin.gem
