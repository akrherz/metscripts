"""Send a tar file of our daily data to staging for upload to GDrive.

Lets run at 12z for the previous date
"""
import datetime
import subprocess
import os
import sys
from pathlib import Path

from pyiem.util import logger

LOG = logger()


def run(date):
    """Upload this date's worth of data!"""
    os.chdir("/data/tmp")
    tarfn = date.strftime("mtarchive_%Y%m%d.tgz")
    # Step 1: Create a gzipped tar file
    cmd = "tar -czf %s /mnt/mtarchive/data/%s" % (
        tarfn,
        date.strftime("%Y/%m/%d"),
    )
    LOG.debug(cmd)
    subprocess.call(cmd, shell=True, stderr=subprocess.PIPE)
    sz = Path(tarfn).stat().st_size
    LOG.debug("%s has size %s", tarfn, sz)
    if sz < 1000:
        LOG.info("%s is too small! %s bytes, aborting", tarfn, sz)
        os.unlink(tarfn)
        return
    remotedir = date.strftime("/stage/DailyMetArchive/%Y/%m")
    cmd = (
        'rsync -a --remove-source-files --rsync-path "mkdir -p %s; rsync" '
        "%s meteor_ldm@metl60.agron.iastate.edu:%s"
    ) % (remotedir, tarfn, remotedir)
    subprocess.call(cmd, shell=True)


def main(argv):
    """Go Main Go!"""
    if len(argv) == 4:
        date = datetime.date(int(argv[1]), int(argv[2]), int(argv[3]))
    else:
        date = datetime.date.today() - datetime.timedelta(days=1)
    run(date)


if __name__ == "__main__":
    main(sys.argv)
