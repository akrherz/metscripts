"""Offload some COD GOES Imagery to CyBox.

see: akrherz/metscripts#1"""
import datetime
import os
import subprocess
import sys

from pyiem.util import logger

LOG = logger()
TMPDIR = "/isu/mtarchive/tmp"
ARCHIVE = "https://iastate.box.com/s/yyxa7bbyofebhjmqnn7zp29qqvmylk4j"


def run(bird, dt, offset, sector):
    """Run for a given date."""
    dt = dt - datetime.timedelta(days=offset)
    path = f"/isu/mtarchive/data/{dt:%Y/%m/%d}/cod/sat/goes{bird}/{sector}"
    if not os.path.isdir(path):
        if offset == 0:
            lvl = LOG.warning if bird == 16 else LOG.info
            lvl(" %s not found", path)
        return
    os.chdir(path)
    zips = []
    for dirname in os.listdir("."):
        if dirname == "HEADER.html":
            continue
        # Save one
        if sector == "regional" and dirname == "midwest":
            continue
        zipfn = f"goes{bird}_{sector}_{dirname}_{dt:%Y%m%d}.zip"
        LOG.debug("creating %s", zipfn)
        with subprocess.Popen(
            f"zip -q -r {TMPDIR}/{zipfn} {dirname}",
            shell=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
        ) as proc:
            (stdout, stderr) = proc.communicate()
        if (
            stdout.decode("ascii", "ignore") == ""
            and stderr.decode("ascii", "ignore") == ""
        ):
            subprocess.call(f"rm -rf {dirname}", shell=True)
        else:
            LOG.warning(
                "Processing goes%s/%s resulted in %s %s",
                bird,
                dirname,
                stdout,
                stderr,
            )
        zips.append(zipfn)
    with open("HEADER.html", "w", encoding="utf-8") as fh:
        fh.write(f'{sector} imagery found <a href="{ARCHIVE}">on CyBox</a>')
    if not zips:
        return
    os.chdir(TMPDIR)
    dirname = f"/stage/mtarchive/{dt:%Y/%m/%d}/cod/sat/goes{bird}/{sector}"
    rsyncpath = f"mkdir -p {dirname} && rsync"
    cmd = (
        f'rsync -a --rsync-path="{rsyncpath}" --remove-source-files '
        f"{' '.join(zips)} meteor_ldm@metl60.agron.iastate.edu:{dirname}/"
    )
    with subprocess.Popen(
        cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE
    ) as proc:
        stdout = proc.stdout.read()
        stderr = proc.stderr.read()
    if stdout != b"" or stderr != b"":
        print(cmd)
        print(stdout.decode("ascii", "ignore"))
        print(stderr.decode("ascii", "ignore"))


def main(argv):
    """Go Main Go."""
    if len(argv) == 4:
        dt = datetime.datetime(int(argv[1]), int(argv[2]), int(argv[3]))
    else:
        dt = datetime.date.today() - datetime.timedelta(days=14)
    # 23 Jan 2023 added regional, so thus the ancient of dates
    for offset in (0, 1, 14, 250, 800, 1600):
        LOG.info("processing offset %s", offset)
        for bird in (16, 17, 18):
            for sector in ["global", "meso", "subregional", "regional"]:
                run(bird, dt, offset, sector)


if __name__ == "__main__":
    main(sys.argv)
