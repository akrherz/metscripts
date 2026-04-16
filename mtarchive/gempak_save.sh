#!/usr/bin/env bash
# Save metfs1 produced gempak files to mtarchive
# called with number of days ago to run, usually 1
# set -x

ddir="/mnt/mtarchive2/data/"
date4=$(date -u --date "${1} days ago" +'%d')
date3=$(date -u --date "${1} days ago" +'%y%m%d')
date2=$(date -u --date "${1} days ago" +'%Y%m%d')
date1=$(date -u --date "${1} days ago" +'%Y/%m/%d')
www="http://metfs1.agron.iastate.edu/data/"

mygetter ()
{
    src="$1"
    dest="$2"
    tmp="${dest}.tmp.$$"

    if [[ -e "$dest" ]]; then
        echo "$(date -u +'%Y-%m-%dT%H:%M:%SZ') ERROR: refusing to overwrite existing file $dest" >&2
        return 1
    fi

    if wget -q -O "$tmp" "$www/$src"; then
        if ! mv -n "$tmp" "$dest"; then
            echo "$(date -u +'%Y-%m-%dT%H:%M:%SZ') ERROR: failed to move $tmp -> $dest" >&2
            rm -f "$tmp"
            return 1
        fi
    else
        rm -f "$tmp"
        echo "$(date -u +'%Y-%m-%dT%H:%M:%SZ') ERROR: wget failed for $www/$src -> $dest" >&2
        return 1
    fi
}

mkdir -p ${ddir}${date1}/text/{Public,Severe,records,Climate,boy,mod,rad,sao,syn,upa}

for hh in $(seq -w 0 23);
do
mygetter text/boy/${date3}${hh}.boy ${ddir}${date1}/text/boy/${date2}${hh}_boy.txt
mygetter text/mod/${date3}${hh}.mod ${ddir}${date1}/text/mod/${date2}${hh}_mod.txt
mygetter text/rad/${date3}${hh}.rad ${ddir}${date1}/text/rad/${date2}${hh}_rad.txt
mygetter text/sao/${date3}${hh}.sao ${ddir}${date1}/text/sao/${date2}${hh}_sao.txt
mygetter text/syn/${date3}${hh}.syn ${ddir}${date1}/text/syn/${date2}${hh}_syn.txt
mygetter text/upa/${date3}${hh}.upa ${ddir}${date1}/text/upa/${date2}${hh}_upa.txt

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
mygetter gempak/surface/${date2}_sao.gem ${ddir}/${date1}/gempak/surface/sao/${date2}_sao.gem

mkdir -p ${ddir}/${date1}/gempak/upperair
mygetter gempak/upperair/${date2}_upa.gem ${ddir}/${date1}/gempak/upperair/${date2}_upa.gem

mkdir -p ${ddir}${date1}/gempak/nldn
for hh in $(seq -w 0 23);
do
mygetter gempak/nldn/${date2}${hh}00_nldn.gem ${ddir}${date1}/gempak/nldn/${date2}${hh}00_nldn.gem 
mygetter gempak/nldn/${date2}${hh}30_nldn.gem ${ddir}${date1}/gempak/nldn/${date2}${hh}30_nldn.gem 
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
