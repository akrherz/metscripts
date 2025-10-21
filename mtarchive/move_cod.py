"""Rearrange the cod data deck chairs on the Titanic."""

import os
import shutil
import subprocess
from datetime import date, datetime, timedelta
from pathlib import Path

import click
from pyiem.util import logger

LOG = logger()


@click.command()
@click.option("--date", "dt", type=click.DateTime(formats=["%Y-%m-%d"]))
def main(dt: datetime | None) -> None:
    """Go Main Go."""
    if dt is None:
        dt = date.today() - timedelta(days=14)
    LOG.info("Running for %s", dt)
    basedir = Path(f"/isu/mtarchive/data/{dt:%Y}/{dt:%m}/{dt:%d}/cod/sat")
    if not basedir.exists():
        # Ensure this gets emailed
        LOG.warning("Exit as directory does not exist: %s", basedir)
        return
    # Check if this path is a symlink, if so, we are done
    if basedir.is_symlink():
        LOG.info("Path %s is a symlink, exiting", basedir)
        return
    # We have work to do, move up one directory as the sat folder will
    # eventually be the sym link
    os.chdir(basedir.parent)
    # will fix this eventually.
    destdir = Path(f"/mnt/mtarchive2a/data/{dt:%Y}/{dt:%m}/{dt:%d}/cod")
    destdir.mkdir(parents=True, exist_ok=True)
    with subprocess.Popen(
        [
            "rsync",
            "-a",
            "--remove-source-files",
            "sat",
            f"{destdir}/",
        ],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    ) as proc:
        stdout, stderr = proc.communicate()
        if stdout != b"" or stderr != b"" or proc.returncode != 0:
            LOG.warning("Aborting %s due to failure...", basedir)
            LOG.warning(stdout.decode("ascii", "ignore"))
            LOG.warning(stderr.decode("ascii", "ignore"))
            return

    # Remove the sat folder recursively
    LOG.info("Removing source directory %s", basedir)
    shutil.rmtree("sat")
    # symlink the new location
    satdir = destdir / "sat"
    LOG.info("Creating symlink to %s", satdir)
    os.symlink(satdir, "sat")
    LOG.info("Done.")


if __name__ == "__main__":
    main()
