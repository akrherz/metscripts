"""Bundle up our MRMS data."""

import datetime
import os
import subprocess
import sys

from pyiem.util import logger, utc

LOG = logger()


def do(mydir, reporterror=True):
    """Do this dir, please!"""
    if not os.path.isdir(mydir):
        if reporterror:
            LOG.info("Wanted to upload dir %s, but not found?!?", mydir)
        return
    zipfn = f"{mydir}.zip"
    if os.path.isfile(zipfn):
        os.unlink(zipfn)
    subprocess.call(f"zip -r -q {zipfn} {mydir}", shell=True)

    remotepath = f"/export/mrms/{mydir[:4]}/{mydir[4:6]}/{mydir[6:8]}"
    cmd = (
        f'rsync -a --rsync-path="mkdir -p {remotepath} && rsync" '
        f"{zipfn} meteor_ldm@iemvm1.agron.iastate.edu:{remotepath}"
    )
    subprocess.call(cmd, shell=True)

    remotepath = f"/offline/MRMS/{mydir[:4]}/{mydir[4:6]}/{mydir[6:8]}"
    cmd = (
        "rsync -a --remove-source-files "
        f'--rsync-path="mkdir -p {remotepath} && rsync" '
        f"{zipfn} meteor_ldm@akrherz-desktop.agron.iastate.edu:{remotepath}"
    )
    subprocess.call(cmd, shell=True)
    subprocess.call(f"rm -rf {mydir}", shell=True)


def main(argv):
    """Go Main Go."""
    os.chdir("/data/mrms")
    if len(argv) > 1:
        mydir = argv[1]
        do(mydir)
        return
    mydir = (utc() - datetime.timedelta(hours=6)).strftime("%Y%m%d%H")
    do(mydir)

    # reprocess with no error reported
    mydir = (utc() - datetime.timedelta(hours=12)).strftime("%Y%m%d%H")
    do(mydir, False)


if __name__ == "__main__":
    main(sys.argv)
