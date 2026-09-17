"""Bundle up our MRMS data."""

import os
import subprocess
import sys
from datetime import timedelta

from pyiem.util import logger, utc

LOG = logger()


def do(mydir: str, reporterror: bool = True):
    """Do this dir, please!"""
    if not os.path.isdir(mydir):
        if reporterror:
            LOG.info("Wanted to upload dir %s, but not found?!?", mydir)
        return
    zipfn = f"{mydir}.zip"
    if os.path.isfile(zipfn):
        os.unlink(zipfn)
    subprocess.run(["zip", "-r", "-q", zipfn, mydir], check=True)

    remotepath = f"/export/mrms2/{mydir[:4]}/{mydir[4:6]}/{mydir[6:8]}"
    cmd = (
        "rsync",
        "-a",
        "--remove-source-files",
        f'--rsync-path="mkdir -p {remotepath} && rsync"',
        zipfn,
        f"meteor_ldm@iemvm2.agron.iastate.edu:{remotepath}",
    )
    subprocess.run(cmd, check=True)

    subprocess.run(["rm", "-rf", mydir], check=True)


def main(argv):
    """Go Main Go."""
    os.chdir("/data/mrms")
    if len(argv) > 1:
        mydir = argv[1]
        do(mydir)
        return
    mydir = (utc() - timedelta(hours=6)).strftime("%Y%m%d%H")
    do(mydir)

    # reprocess with no error reported
    mydir = (utc() - timedelta(hours=12)).strftime("%Y%m%d%H")
    do(mydir, False)


if __name__ == "__main__":
    main(sys.argv)
