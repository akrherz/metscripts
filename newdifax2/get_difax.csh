#! /bin/csh 

source ../COMMON.csh

set hr = ${1}
set ddir = "~/projects/metscripts/newdifax2"

foreach file ( `cat ${ddir}/${1}zfiles.txt | cut -d" " -f1` )
set newname = `cat ${ddir}/${1}zfiles.txt | grep ${file} | cut -d" " -f2`
wget -q https://tgftp.nws.noaa.gov/fax/${file}
if ( -f ${file} ) then
  convert -rotate 180 -resize 50% ${file} ${newname}
endif
end

rm *.TIF
keep *.gif
mv *.gif $WEBPIX/difax/
