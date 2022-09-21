#!/bin/csh
# This file simply saves the ETA plots into the current and archive 
# 13 Jun 2002:	Comment out the echos


source ../COMMON.csh

if (-f ${1}.gif ) then
	mv ${1}.gif $CURRENT/${3}F00.gif
else
	cp black.gif $CURRENT/${3}F00.gif
	echo Did not find "${1}.gif" 
endif

if (-f ${1}.gif.001 ) then
	mv ${1}.gif.001 $CURRENT/${3}F06.gif
else
	cp black.gif $CURRENT/${3}F06.gif
	echo Did not find "${1}.gif.001" 
endif

if (-f ${1}.gif.002 ) then
	mv ${1}.gif.002 $CURRENT/${3}F12.gif
else
	cp black.gif $CURRENT/${3}F12.gif
	echo Did not find "${1}.gif.002" 
endif

if (-f ${1}.gif.003 ) then
	mv ${1}.gif.003 $CURRENT/${3}F18.gif
else
	cp black.gif $CURRENT/${3}F18.gif
	echo Did not find "${1}.gif.003" 
endif

if (-f ${1}.gif.004 ) then
	mv ${1}.gif.004 $CURRENT/${3}F24.gif
else
	cp black.gif $CURRENT/${3}F24.gif
	echo Did not find "${1}.gif.004" 
endif

if (-f ${1}.gif.005 ) then
	mv ${1}.gif.005 $CURRENT/${3}F30.gif
else
	cp black.gif $CURRENT/${3}F30.gif
	echo Did not find "${1}.gif.005" 
endif

if (-f ${1}.gif.006 ) then
	mv ${1}.gif.006 $CURRENT/${3}F36.gif
else
	cp black.gif $CURRENT/${3}F36.gif
	echo Did not find "${1}.gif.006" 
endif

if (-f ${1}.gif.007 ) then
	mv ${1}.gif.007 $CURRENT/${3}F42.gif
else
	cp black.gif $CURRENT/${3}F42.gif
	echo Did not find "${1}.gif.007" 
endif

if (-f ${1}.gif.008 ) then
	mv ${1}.gif.008 $CURRENT/${3}F48.gif
else
	cp black.gif $CURRENT/${3}F48.gif
	echo Did not find "${1}.gif.008" 
endif

if (-f ${1}.gif.009 ) then
	mv ${1}.gif.009 $CURRENT/${3}F54.gif
else
	cp black.gif $CURRENT/${3}F54.gif
	echo Did not find "${1}.gif.009" 
endif

if (-f ${1}.gif.010 ) then
	mv ${1}.gif.010 $CURRENT/${3}F60.gif
else
	cp black.gif $CURRENT/${3}F60.gif
	echo Did not find "${1}.gif.010" 
endif

if (-f ${1}.gif.011 ) then
    mv ${1}.gif.011 $CURRENT/${3}F66.gif
else
        cp black.gif $CURRENT/${3}F66.gif
        echo Did not find "${1}.gif.011"
endif

if (-f ${1}.gif.012 ) then
        mv ${1}.gif.012 $CURRENT/${3}F72.gif
else
        cp black.gif $CURRENT/${3}F72.gif
#        echo Did not find "${1}.gif.012"
endif
