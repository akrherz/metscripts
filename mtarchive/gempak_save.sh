# Save metfs1 produced gempak files to mtarchive
# called with number of days ago to run, usually 1
# set -x

ddir="/isu/mtarchive/data/"
date4=$(date -u --date "${1} days ago" +'%d')
date3=$(date -u --date "${1} days ago" +'%y%m%d')
date2=$(date -u --date "${1} days ago" +'%Y%m%d')
date1=$(date -u --date "${1} days ago" +'%Y/%m/%d')
www="http://metfs1.agron.iastate.edu/data/"

mygetter ()
{
    wget -q -O $2 $www/$1	
}

mkdir -p ${ddir}${date1}/text/{Public,Severe,records,Climate,boy,mod,rad,sao,syn,upa}

h=( 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 )

for cc in $(seq 0 23);
do
mygetter text/boy/${date3}${h[$cc]}.boy ${ddir}${date1}/text/boy/${date2}${h[$cc]}_boy.txt
mygetter text/mod/${date3}${h[$cc]}.mod ${ddir}${date1}/text/mod/${date2}${h[$cc]}_mod.txt
mygetter text/rad/${date3}${h[$cc]}.rad ${ddir}${date1}/text/rad/${date2}${h[$cc]}_rad.txt
mygetter text/sao/${date3}${h[$cc]}.sao ${ddir}${date1}/text/sao/${date2}${h[$cc]}_sao.txt
mygetter text/syn/${date3}${h[$cc]}.syn ${ddir}${date1}/text/syn/${date2}${h[$cc]}_syn.txt
mygetter text/upa/${date3}${h[$cc]}.upa ${ddir}${date1}/text/upa/${date2}${h[$cc]}_upa.txt

done

mygetter text/Public/Public.${date4} ${ddir}${date1}/text/Public/Public_${date4}.txt
mygetter text/Severe/Severe.${date4} ${ddir}${date1}/text/Severe/Severe_${date4}.txt
mygetter text/Record/Record.${date4} ${ddir}${date1}/text/records/Record_${date4}.txt
mygetter text/Climate/Climate.${date4} ${ddir}${date1}/text/Climate/Climate_${date4}.txt

mkdir -p ${ddir}/${date1}/gempak/mos
mygetter gempak/mos/${date2}00_gmos.gem ${ddir}/${date1}/gempak/mos/${date2}00_gmos.gem
mygetter gempak/mos/${date2}12_gmos.gem ${ddir}/${date1}/gempak/mos/${date2}12_gmos.gem

mkdir -p ${ddir}/${date1}/gempak/model
mygetter gempak/model/nam/${date2}00_nam212.gem ${ddir}/${date1}/gempak/model/${date2}00_nam212.gem
mygetter gempak/model/nam/${date2}12_nam212.gem ${ddir}/${date1}/gempak/model/${date2}12_nam212.gem
mygetter gempak/model/nam/${date2}00_nam211.gem ${ddir}/${date1}/gempak/model/${date2}00_nam211.gem
mygetter gempak/model/nam/${date2}12_nam211.gem ${ddir}/${date1}/gempak/model/${date2}12_nam211.gem

mkdir -p ${ddir}/${date1}/gempak/surface/sao
mygetter gempak/surface/sao/${date2}_sao.gem ${ddir}/${date1}/gempak/surface/sao/${date2}_sao.gem

mkdir -p ${ddir}/${date1}/gempak/upperair
mygetter gempak/upperair/${date2}_upa.gem ${ddir}/${date1}/gempak/upperair/${date2}_upa.gem

mkdir -p ${ddir}${date1}/gempak/nldn
for cc in $(seq 0 23);
do
mygetter gempak/nldn/${date2}${h[$cc]}00_nldn.gem ${ddir}${date1}/gempak/nldn/${date2}${h[$cc]}00_nldn.gem 
mygetter gempak/nldn/${date2}${h[$cc]}30_nldn.gem ${ddir}${date1}/gempak/nldn/${date2}${h[$cc]}30_nldn.gem 
done

mygetter gempak/model/ruc/${date2}00_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}00_ruc130.gem
mygetter gempak/model/ruc/${date2}03_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}03_ruc130.gem
mygetter gempak/model/ruc/${date2}06_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}06_ruc130.gem
mygetter gempak/model/ruc/${date2}09_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}09_ruc130.gem
mygetter gempak/model/ruc/${date2}12_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}12_ruc130.gem
mygetter gempak/model/ruc/${date2}15_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}15_ruc130.gem
mygetter gempak/model/ruc/${date2}18_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}18_ruc130.gem
mygetter gempak/model/ruc/${date2}21_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}21_ruc130.gem

mygetter gempak/model/gfs/${date2}00_gfs215.gem ${ddir}/${date1}/gempak/model/${date2}00_gfs215.gem
mygetter gempak/model/gfs/${date2}12_gfs215.gem ${ddir}/${date1}/gempak/model/${date2}12_gfs215.gem

mygetter gempak/model/gfs/${date2}00_thin.gem ${ddir}/${date1}/gempak/model/${date2}00_thin.gem
mygetter gempak/model/gfs/${date2}12_thin.gem ${ddir}/${date1}/gempak/model/${date2}12_thin.gem
