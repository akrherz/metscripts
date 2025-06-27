"""Offload some COD GOES Imagery to CyBox.

see: akrherz/metscripts#1"""

import os
import subprocess
from datetime import date, datetime, timedelta

import click
from pyiem.util import logger

LOG = logger()
TMPDIR = "/mnt/mtarchivetmp"
ARCHIVE = "https://iastate.box.com/s/yyxa7bbyofebhjmqnn7zp29qqvmylk4j"


def run(bird, dt, offset, sector, dryrun: bool):
    """Run for a given date."""
    dt = dt - timedelta(days=offset)
    path = f"/isu/mtarchive/data/{dt:%Y/%m/%d}/cod/sat/goes{bird}/{sector}"
    if not os.path.isdir(path):
        if offset == 0:
            lvl = LOG.warning if bird == 19 else LOG.info
            lvl(" %s not found", path)
        return
    os.chdir(path)
    # Debug something happening in the wild
    LOG.warning("Processing `%s` with pwd now `%s`", path, os.getcwd())
    zips = []
    for dirname in os.listdir("."):
        if dirname == "HEADER.html":
            continue
        if not os.path.isdir(dirname):
            LOG.warning("skipping %s, not a directory", dirname)
            continue
        # Save one
        if sector == "regional" and dirname == "midwest":
            continue
        zipfn = f"goes{bird}_{sector}_{dirname}_{dt:%Y%m%d}.zip"
        zipcmd = ["zip", "-q", "-r", f"{TMPDIR}/{zipfn}", dirname]
        LOG.info("Running %s", zipcmd)
        if not dryrun:
            with subprocess.Popen(
                zipcmd,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
            ) as proc:
                (stdout, stderr) = proc.communicate()
            if (
                stdout.decode("ascii", "ignore") == ""
                and stderr.decode("ascii", "ignore") == ""
            ):
                subprocess.call(["rm", "-rf", dirname])
            else:
                LOG.warning(
                    "Processing goes%s/%s resulted in %s %s",
                    bird,
                    dirname,
                    stdout,
                    stderr,
                )
            with open("HEADER.html", "w", encoding="utf-8") as fh:
                fh.write(
                    f'{sector} imagery found <a href="{ARCHIVE}">on CyBox</a>'
                )
        zips.append(zipfn)
    if not zips:
        return
    os.chdir(TMPDIR)
    dirname = f"/stage/mtarchive/{dt:%Y/%m/%d}/cod/sat/goes{bird}/{sector}"
    rsyncpath = f"mkdir -p {dirname} && rsync"
    cmd = [
        "rsync",
        "-a",
        "--rsync-path",
        rsyncpath,
        "--remove-source-files",
        *zips,
        f"meteor_ldm@akrherz-desktop.agron.iastate.edu:{dirname}/",
    ]
    if not dryrun:
        with subprocess.Popen(
            cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE
        ) as proc:
            stdout, stderr = proc.communicate()
        if stdout != b"" or stderr != b"":
            print(cmd)
            print(stdout.decode("ascii", "ignore"))
            print(stderr.decode("ascii", "ignore"))
    else:
        print(" ".join(cmd))


@click.command()
@click.option("--date", "dt", type=click.DateTime(formats=["%Y-%m-%d"]))
@click.option("--dryrun", is_flag=True, help="Do not actually run, just print")
def main(dt: datetime | None, dryrun: bool) -> None:
    """Go Main Go."""
    if dt is None:
        dt = date.today() - timedelta(days=14)
    # 23 Jan 2023 added regional, so thus the ancient of dates
    for offset in (0, 1, 14, 250, 800, 1600):
        LOG.info("processing offset %s", offset)
        for bird in (16, 17, 18, 19):
            for sector in ["global", "meso", "subregional", "regional"]:
                run(bird, dt, offset, sector, dryrun)


if __name__ == "__main__":
    main()
