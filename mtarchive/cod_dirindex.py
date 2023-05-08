"""Generate Index Files within the COD folders

    We are run from cron each hour and run for the day that was 90 minutes
    in the past.  Will have to see if this does what we want!

"""
from __future__ import print_function

import datetime
import os
import sys

BASE = "/isu/mtarchive/data"
INDEXFN = "000index.txt"


def dodate(date):
    """Run for this date please"""
    mydir = "%s/%s/cod" % (BASE, date.strftime("%Y/%m/%d"))
    for root, _, files in os.walk(mydir):
        if len(files) == 0:
            continue
        files.sort()
        content = "\n".join([fn for fn in files if fn != INDEXFN])
        output = open("%s/%s" % (root, INDEXFN), "w")
        output.write(content)
        output.close()


def main(argv):
    """Main workflow"""
    if len(argv) == 1:
        valid = datetime.datetime.utcnow() - datetime.timedelta(minutes=90)
    else:
        valid = datetime.datetime(int(argv[1]), int(argv[2]), int(argv[3]))
        print("Manual run for: %s" % (valid.date(),))
    dodate(valid.date())


if __name__ == "__main__":
    main(sys.argv)
