#!/bin/csh

set nexrad=$1

cd ~/data/nexrd2/raw/$1

ls --block-size=1 -1as > dir.list
