"""Create a virtual file system for files on cybox.

These are later handled by an apache redirect to point the client to the right
place.

Notes:
 - To auth this app, use `rclone config reconnect box:` and edit cybox.json
"""

# stdlib
import datetime
import json
import logging
import os
import re
import sys

# 3rd party
import boxsdk
from pyiem.util import get_properties, logger

LOG = logger()
FILENAME_RE = re.compile(r"^\d{10}\.zip$")
MTARCHIVE_PATH = "/isu/mtarchive/data"

# Need to adjust the boxsdk default logging level
logging.getLogger("boxsdk").setLevel(logging.CRITICAL)


def store_tokens_cb(access_token, refresh_token):
    """Save to database."""
    LOG.info("Saving tokens")
    data = {"access_token": access_token, "refresh_token": refresh_token}
    # Write this json to file
    with open("cybox.json", "w", encoding="utf-8") as fh:
        json.dump(data, fh)


def walk(client, folder, dirpath):
    """Walk the directory tree."""
    items = client.folder(folder_id=folder).get_items(limit=1000)
    for item in items:
        if item.type == "file":
            item.dirpath = dirpath
            yield item
        elif item.type == "folder":
            yield from walk(client, item.id, os.path.join(dirpath, item.name))


def find_in_folder(client, baseid, lookfor):
    """Walk the directory tree."""
    items = client.folder(folder_id=baseid).get_items(limit=1000)
    for item in items:
        if item.name == lookfor:
            return item.id
    LOG.info("Failed to find %s in %s, aborting", lookfor, baseid)
    sys.exit()


def main(argv):
    """Go Main."""
    dt = datetime.date(int(argv[1]), int(argv[2]), int(argv[3]))
    LOG.info("Running for %s", dt)
    props = get_properties()
    with open("cybox.json", encoding="utf-8") as fh:
        data = json.load(fh)
    # Get the Box oauth
    oauth = boxsdk.OAuth2(
        client_id=props["boxclient.client_id"],
        client_secret=props["boxclient.client_secret"],
        access_token=data["access_token"],
        refresh_token=data["refresh_token"],
        store_tokens=store_tokens_cb,
    )

    client = boxsdk.Client(oauth)
    # Searching is not working as not all files are returned for sad reasons
    # So we must do some manual walking
    folder = find_in_folder(client, 0, "mtarchive")
    folder = find_in_folder(client, folder, f"{dt.year}")
    folder = find_in_folder(client, folder, f"{dt:%m}")
    folder = find_in_folder(client, folder, f"{dt:%d}")
    folder = find_in_folder(client, folder, "cod")
    folder = find_in_folder(client, folder, "sat")
    dirpath = f"{dt:%Y/%m/%d}/cod/sat"
    items = list(walk(client, folder, dirpath))
    for item in items:
        filename = item.name
        dirpath = f"{MTARCHIVE_PATH}/{item.dirpath}"
        # Atone for past sins.  We uploaded some cruft in the past, which
        # should now be gone, but always better to be safe than sorry
        if len(filename.split(".zip")) >= 3:
            print(f"Deleting {filename}")
            item.delete()
            localfn = os.path.join(dirpath, filename)
            if os.path.isfile(localfn):
                print(f"Deleting {localfn}")
                os.unlink(localfn)
            continue
        os.makedirs(dirpath, exist_ok=True)
        localfn = os.path.join(dirpath, filename)
        if os.path.isfile(localfn):
            continue
        # Get the shared link of this item
        url = item.get_shared_link(
            access="open",
            can_download=True,
        )
        # we want to store the url in the virtual file for later usage
        LOG.info("Writing %s", localfn)
        with open(localfn, "w", encoding="utf-8") as fh:
            fh.write(url.replace("/s/", "/shared/static/"))


if __name__ == "__main__":
    main(sys.argv)
