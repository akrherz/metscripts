source ../COMMON.csh

set date1 = `date --date "${1} days" '+%Y/%m/%d'`
set d1="${ddir}${date1}"

# make directory for day
mkdir -p ${d1}

# make directory and subdirectories for pix
mkdir -p ${d1}/pix
mkdir -p ${d1}/pix/rad
mkdir -p ${d1}/pix/lapse
mkdir -p ${d1}/pix/lapse/00z
mkdir -p ${d1}/pix/lapse/12z
mkdir -p ${d1}/pix/gfs
mkdir -p ${d1}/pix/gfs/00z
mkdir -p ${d1}/pix/gfs/12z
mkdir -p ${d1}/pix/ecm
mkdir -p ${d1}/pix/eta
mkdir -p ${d1}/pix/eta/00z
mkdir -p ${d1}/pix/eta/12z
mkdir -p ${d1}/pix/gemwx
mkdir -p ${d1}/pix/ltg 
mkdir -p ${d1}/pix/ltg/Midwest_lightning_past_hour
mkdir -p ${d1}/pix/ltg/US_lightning_past_hour
mkdir -p ${d1}/pix/mos
mkdir -p ${d1}/pix/mos/00z
mkdir -p ${d1}/pix/mos/12z
mkdir -p ${d1}/pix/mrf
mkdir -p ${d1}/pix/pro
mkdir -p ${d1}/pix/pro/300mb_winds
mkdir -p ${d1}/pix/pro/800m_winds
mkdir -p ${d1}/pix/pro/850mb_700mb_500mb_winds
mkdir -p ${d1}/pix/pro/1000m_winds
mkdir -p ${d1}/pix/pro/Slater_time_series_profile
mkdir -p ${d1}/pix/ruc
mkdir -p ${d1}/pix/ruc/00z
mkdir -p ${d1}/pix/ruc/01z
mkdir -p ${d1}/pix/ruc/02z
mkdir -p ${d1}/pix/ruc/03z
mkdir -p ${d1}/pix/ruc/04z
mkdir -p ${d1}/pix/ruc/05z
mkdir -p ${d1}/pix/ruc/06z
mkdir -p ${d1}/pix/ruc/07z
mkdir -p ${d1}/pix/ruc/08z
mkdir -p ${d1}/pix/ruc/09z
mkdir -p ${d1}/pix/ruc/10z
mkdir -p ${d1}/pix/ruc/11z
mkdir -p ${d1}/pix/ruc/12z
mkdir -p ${d1}/pix/ruc/13z
mkdir -p ${d1}/pix/ruc/14z
mkdir -p ${d1}/pix/ruc/15z
mkdir -p ${d1}/pix/ruc/16z
mkdir -p ${d1}/pix/ruc/17z
mkdir -p ${d1}/pix/ruc/18z
mkdir -p ${d1}/pix/ruc/19z
mkdir -p ${d1}/pix/ruc/20z
mkdir -p ${d1}/pix/ruc/21z
mkdir -p ${d1}/pix/ruc/22z
mkdir -p ${d1}/pix/ruc/23z
mkdir -p ${d1}/pix/sat
mkdir -p ${d1}/pix/sat/IR
mkdir -p ${d1}/pix/sat/WV
mkdir -p ${d1}/pix/sat/VIS
mkdir -p ${d1}/pix/sfc/
mkdir -p ${d1}/pix/sfc/dewpoint_winds
mkdir -p ${d1}/pix/sfc/moisture_divergence
mkdir -p ${d1}/pix/sfc/sfc_obs
mkdir -p ${d1}/pix/sfc/temp_winds
mkdir -p ${d1}/pix/sfc/theta_e
mkdir -p ${d1}/pix/skew
mkdir -p ${d1}/pix/skew/00z
mkdir -p ${d1}/pix/skew/12z
mkdir -p ${d1}/pix/tmp
mkdir -p ${d1}/pix/ua
mkdir -p ${d1}/pix/ukmet
mkdir -p ${d1}/pix/ukmet/00z
mkdir -p ${d1}/pix/ukmet/12z

# make directory and subdirectories for gempak files
mkdir -p ${d1}/gempak
mkdir -p ${d1}/gempak/model
mkdir -p ${d1}/gempak/mos
# note that archive access is controlled via apache
mkdir -p ${d1}/gempak/nldn
mkdir -p ${d1}/gempak/profiler
mkdir -p ${d1}/gempak/surface
mkdir -p ${d1}/gempak/surface/rwis
mkdir -p ${d1}/gempak/surface/sao
mkdir -p ${d1}/gempak/surface/snet
mkdir -p ${d1}/gempak/upperair

# make directory and subdirectories for text data
mkdir -p ${d1}/text
mkdir -p ${d1}/text/Public
mkdir -p ${d1}/text/Severe
mkdir -p ${d1}/text/boy
mkdir -p ${d1}/text/mod
mkdir -p ${d1}/text/rad
mkdir -p ${d1}/text/Climate
mkdir -p ${d1}/text/records
mkdir -p ${d1}/text/sao
mkdir -p ${d1}/text/syn
mkdir -p ${d1}/text/upa

