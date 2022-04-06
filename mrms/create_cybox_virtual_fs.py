"""Create a virtual file system for files on cybox.

These are later handled by an apache redirect to point the client to the right
place.

Notes:
 - To auth this app, use `rclone config reconnect box:` and edit cybox.json
"""
# stdlib
import datetime
import json
import os
import re
import sys

# 3rd party
import boxsdk
from pyiem.util import get_properties, logger

LOG = logger()
FILENAME_RE = re.compile(r"^\d{10}\.zip$")
MRMS_PATH = "/mnt/mrms"


def store_tokens_cb(access_token, refresh_token):
    """Save to database."""
    LOG.info("Saving tokens")
    data = {"access_token": access_token, "refresh_token": refresh_token}
    # Write this json to file
    with open("cybox.json", "w", encoding="utf-8") as fh:
        json.dump(data, fh)


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
    # Search for a filename within the MRMS folder
    items = client.search().query(
        ancestor_folder_ids=154474545014,
        content_types="name",
        query=f'"{dt:%Y%m%d}"',
        type="file",
    )
    for item in items:
        filename = item.name
        if FILENAME_RE.match(filename) is None:
            LOG.warning("Got unknown filename: %s", filename)
            continue
        valid = datetime.datetime.strptime(filename[:10], "%Y%m%d%H")
        basedir = os.path.join(MRMS_PATH, valid.strftime("%Y/%m/%d"))
        os.makedirs(basedir, exist_ok=True)
        localfn = os.path.join(basedir, filename)
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