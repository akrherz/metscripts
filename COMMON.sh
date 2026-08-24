#!/bin/bash
# Migrated from legacy COMMON.csh

. /home/gempak/NAWIPS/Gemenviron.profile

# Reset the MODEL variable
export MODEL=/data/gempak/model

export CURRENT=/home/www/meteor/html/wx/data/current/
export WEBPIX=/home/www/meteor/html/pix

export DISPLAY=:1

export ddir="/mnt/mtarchive2/data/"

yy="$(date -u +%y)"
export yy
yyyy="$(date -u +%Y)"
export yyyy
mm="$(date -u +%m)"
export mm
dd="$(date -u +%d)"
export dd
date="${yy}${mm}${dd}"
export date
DATE="$(date -u +%Y%m%d)"
export DATE
DATE2="$(date -u +%Y/%m/%d)"
export DATE2
hh="$(date -u +%H)"
export hh
ddir2="${ddir}${DATE2}"
export ddir2
TIMESTAMP="${yy}${mm}${dd}${hh}"
export TIMESTAMP
