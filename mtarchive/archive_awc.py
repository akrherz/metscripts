"""Archive some of the AWC data.

https://www.aviationweather.gov/data/products/

afd - NWS Text data we have elsewhere
[ ] ecfp - Extended Convective Forecast Product
ellrod - Forecast Product
etcf - Forecast Product
fa - Text data archived elsewhere
fax - old FAX style charts, too much data
fbwind - Text data
gairmet	- Unsure
gates - HRRR forecast
[ ] gfa - Graphical forecast
gfam - too much data
hazards - JSON product
icing - too much data
lamp - too much data
ndfd - too much data
[ ] progs - forecast maps
rap - GIS rasters
sigmet - archive via other means
[ ] swh - prog high
[ ] swl - prog low
[ ] swm - prog med
taf - archived in other means
tcf - already appear to be archiving
turbulence - too much data
wafs - GIS data
wind - too much data
"""

import os
import subprocess
import sys
from datetime import date, timedelta

DIRS_TO_SYNC = "ecfp gfa progs swh swl swm".split()
BASEDIR = "/isu/mtarchive/data"
WEBBASE = "https://www.aviationweather.gov/data/products/"


def main(argv):
    """Go Main Go."""
    dt = date.today() - timedelta(days=1)
    if len(argv) == 4:
        dt = date(int(argv[1]), int(argv[2]), int(argv[3]))
    mydir = os.path.join(BASEDIR, dt.strftime("%Y/%m/%d"), "awc_web")
    os.makedirs(mydir, exist_ok=True)
    os.chdir(mydir)
    for dirname in DIRS_TO_SYNC:
        os.makedirs(dirname, exist_ok=True)
        # Mirror the folder via lftp command
        webfolder = f"{WEBBASE}{dirname}/"
        proc = subprocess.run(
            [
                "lftp",
                "-e",
                f"mirror -n {dt:%Y%m%d} {dirname}; quit",
                webfolder,
            ],
            check=True,
            timeout=1800,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
        )
        if proc.returncode != 0:
            print(dirname)
            print(proc.stderr.decode())
            print(proc.stdout.decode())


if __name__ == "__main__":
    main(sys.argv)
