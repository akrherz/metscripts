"""Rearrange the cod data deck chairs on the Titanic."""

import os
import shutil
import subprocess
from datetime import date, datetime, timedelta
from pathlib import Path

import click
from pyiem.util import logger

LOG = logger()

A0A = "/mnt/mtarchive0a/data"
A2A = "/mnt/mtarchive2a/data"
A6A = "/mnt/mtarchive6a/data"
A6Z = "/mnt/mtarchive6z/data"
A8A = "/mnt/mtarchive8a/data"
A13A = "/mnt/mtarchive13a/data"
# inclusive start date, end date, and path
SHARDS = [
    (date(2018, 1, 1), date(2018, 12, 31), A0A),
    (date(2019, 1, 1), date(2019, 12, 31), A13A),
    (date(2020, 1, 1), date(2020, 12, 31), A6A),
    (date(2021, 1, 1), date(2023, 12, 31), A8A),
    (date(2024, 1, 1), date(2024, 12, 31), A0A),
    (date(2025, 1, 1), date(2030, 12, 31), A2A),
]


@click.command()
@click.option("--date", "dt", type=click.DateTime(formats=["%Y-%m-%d"]))
def main(dt: datetime | None) -> None:
    """Go Main Go."""
    if dt is None:
        dt = date.today() - timedelta(days=14)
    else:
        dt = dt.date()
    # Compute the shard this date belongs to
    shard_path = None
    for sdate, edate, path in SHARDS:
        if sdate <= dt <= edate:
            shard_path = path
            break
    if shard_path is None:
        LOG.warning("No shard found for date %s", dt)
        return

    shard_path = Path(shard_path) / f"{dt:%Y}/{dt:%m}/{dt:%d}/cod"

    LOG.info("Running for %s [%s]", dt, shard_path)
    basedir = Path(f"/isu/mtarchive/data/{dt:%Y}/{dt:%m}/{dt:%d}/cod/sat")
    if not basedir.exists():
        # Ensure this gets emailed
        LOG.warning("Exit as directory does not exist: %s", basedir)
        return
    # Check if this path is a symlink
    if basedir.is_symlink():
        # Check that this basedir actually points to the shard_path
        realpath = basedir.resolve()
        if realpath == shard_path / "sat":
            LOG.info("Path %s points to %s, exiting", basedir, realpath)
            return
        LOG.info("Path %s is a symlink to %s, needs update", basedir, realpath)
        # Remove the symlink to prepare for new one
        basedir.unlink()
        # create new symlink
        os.symlink(shard_path / "sat", basedir)
        LOG.info("Created symlink for %s to %s", basedir, shard_path / "sat")
        return
    # We have work to do, move up one directory as the sat folder will
    # eventually be the sym link
    os.chdir(basedir.parent)
    shard_path.mkdir(parents=True, exist_ok=True)
    with subprocess.Popen(
        [
            "rsync",
            "-a",
            "--remove-source-files",
            "sat",
            f"{shard_path}/",
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
    satdir = shard_path / "sat"
    LOG.info("Creating symlink to %s", satdir)
    os.symlink(satdir, "sat")
    LOG.info("Done.")


if __name__ == "__main__":
    main()
