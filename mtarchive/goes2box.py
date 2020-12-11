"""Offload some COD GOES Imagery to CyBox.

see: akrherz/metscripts#1"""
import sys
import os
import datetime
import subprocess

from pyiem.util import logger

LOG = logger()
TMPDIR = "/isu/mtarchive/tmp"
ARCHIVE = "https://drive.google.com/drive/folders/1CaKEmYK5UBio7iro_6JjiLOFJiPvBLaj"


def run(bird, dt, offset, sector):
    """Run for a given date."""
    dt = dt - datetime.timedelta(days=offset)
    path = ("/isu/mtarchive/data/%s/cod/sat/goes%s/%s") % (
        dt.strftime("%Y/%m/%d"),
        bird,
        sector,
    )
    if not os.path.isdir(path):
        if offset == 0:
            print("goes2box %s not found" % (path,))
        return
    os.chdir(path)
    zips = []
    for dirname in os.listdir("."):
        if dirname == "HEADER.html":
            continue
        zipfn = "goes%s_%s_%s_%s.zip" % (bird, sector, dirname, dt.strftime("%Y%m%d"))
        LOG.debug("creating %s", zipfn)
        proc = subprocess.Popen(
            "zip -q -r %s/%s %s" % (TMPDIR, zipfn, dirname),
            shell=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
        )
        (stdout, stderr) = proc.communicate()
        if (
            stdout.decode("ascii", "ignore") == ""
            and stderr.decode("ascii", "ignore") == ""
        ):
            subprocess.call("rm -rf %s" % (dirname,), shell=True)
        else:
            print(
                "goes2box processing goes%s/%s resulted in %s %s"
                % (bird, dirname, stdout, stderr)
            )
        zips.append(zipfn)
    with open("HEADER.html", "w") as fh:
        fh.write(f'{sector} imagery found <a href="{ARCHIVE}">on Google Drive</a>')
    if not zips:
        return
    os.chdir(TMPDIR)
    dirname = "/stage/mtarchive/%s/%02i/%02i/cod/sat/goes%s/%s" % (
        dt.year,
        dt.month,
        dt.day,
        bird,
        sector,
    )
    rsyncpath = "mkdir -p %s && rsync" % (dirname,)
    cmd = (
        'rsync -a --rsync-path="%s" --remove-source-files '
        "%s meteor_ldm@metl60.agron.iastate.edu:%s/"
    ) % (rsyncpath, " ".join(zips), dirname)
    proc = subprocess.Popen(
        cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE
    )
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
    # as of 6 Feb, we need to be backprocessing 1 Jan 2018 data, can offload
    for offset in (0, 1, 14, 250, 800):
        LOG.debug("processing offset %s", offset)
        for bird in (16, 17):
            for sector in ["global", "meso", "subregional"]:
                run(bird, dt, offset, sector)


if __name__ == "__main__":
    main(sys.argv)
