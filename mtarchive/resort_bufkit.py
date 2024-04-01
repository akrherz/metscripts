"""
Fix GEMPAK Y21K bug with bufkit files sorted improperly.
"""

import glob
import shutil

from tqdm import tqdm


def main():
    """Go Main."""
    progress = tqdm(glob.glob("*.buf"))
    for fn in progress:
        progress.set_description(fn)
        shutil.copyfile(fn, f"{fn}.orig")
        accum = []
        sections = [""] * 200
        pos = -1
        for line in open(fn).readlines():
            if line.startswith("STIM"):
                pos = int(line.strip().split("=")[1])
            if line.startswith("STID"):
                sections[pos + 1] = "\n".join(accum)
                accum = []
            accum.append(line.strip())
        sections[pos + 1] = "\n".join(accum)
        with open(fn, "w", encoding="ascii") as fh:
            fh.write("\n".join([s for s in sections if s != ""]))


if __name__ == "__main__":
    main()
