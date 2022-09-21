#!/bin/csh

source ../COMMON.csh

foreach name (`cut -f1 full.list`)
csh wskew_script.csh $1 ${name} `grep ^${name} full.list | cut -f2`
if (-e $WEBPIX/skew/skew_${name}_${1}.gif) then
    cp $WEBPIX/skew/skew_${name}_${1}.gif ${ddir2}/pix/skew/${1}z/${DATE}${1}_skewt_${name}.gif 
  endif
end
