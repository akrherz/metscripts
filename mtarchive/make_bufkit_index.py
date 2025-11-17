"""
Create a faked Apache index.html listing so to keep the AI bots happy.
"""

from __future__ import annotations

import datetime
import html
import sys
from pathlib import Path

# Column widths similar to Apache's output
NAME_COL = 23
DATE_COL = 20
SIZE_COL = 7


def apache_date(ts):
    return datetime.datetime.fromtimestamp(ts).strftime("%d-%b-%Y %H:%M")


def apache_size(bytes_):
    if bytes_ < 0:
        return "-"
    for suffix in ["", "K", "M", "G", "T"]:
        if bytes_ < 1024 or suffix == "T":
            if suffix == "":
                return str(bytes_)
            return f"{bytes_}{suffix}"
        bytes_ //= 1024
    return str(bytes_)


def entry_line(display: str, link_html: str, mtime: str, size: str) -> str:
    """
    display: plain text used for padding (e.g. 'file.txt' or 'dir/')
    link_html: already-escaped HTML for the name (e.g. '<a href="..."></a>')
    mtime: formatted date string
    size: formatted size string
    Returns one line (with newline) to be placed inside the <pre>.
    """
    # pad based on the plain display text length (not counting HTML tags)
    padded_name = display.ljust(NAME_COL)
    # Insert the HTML link in place of the padded plain text.
    # To keep alignment, replace the plain text segment with the link_html,
    # while preserving surrounding spaces.
    # Build the left portion as the padded_name but replace the first
    # occurrence
    # of the display text with link_html.
    # If display appears multiple times (unlikely), only replace the first.
    left = padded_name
    if display:
        left = padded_name.replace(display, link_html, 1)
    else:
        left = link_html.ljust(NAME_COL)
    return f"{left} {mtime.ljust(DATE_COL)} {size.rjust(SIZE_COL)}\n"


def generate_fancyindex(path: Path) -> str:
    """Fancy."""
    webpath = path.as_posix().split("/data")[1]
    title = f"Index of {webpath}"
    lines = []

    lines.append(f"<html><head><title>{html.escape(title)}</title></head>\n")
    lines.append("<body>\n")
    lines.append(f"<h1>{html.escape(title)}</h1>\n")
    lines.append("<pre>\n")
    lines.append(
        "      Name                    Last modified      Size  Description\n"
    )
    lines.append("<hr>\n")

    # Parent directory
    if path.parent != path:
        # Use parent dir mtime (approx) for apache-like output
        try:
            parent_mtime = apache_date(path.parent.stat().st_mtime)
        except Exception:
            parent_mtime = "-"
        display = "Parent Directory"
        link_html = '<a href="../">Parent Directory</a>'
        lines.append(
            entry_line(display + "/", link_html + "/", parent_mtime, "-")
        )

    entries = sorted(path.iterdir(), key=lambda p: p.name.lower())

    for e in entries:
        # Don't index an existing index.html
        if e.name == "index.html":
            continue
        try:
            st = e.stat()
        except PermissionError:
            # skip entries we can't stat
            continue

        is_dir = e.is_dir()
        display_name = e.name + ("/" if is_dir else "")
        # choose icon name (kept as usual apache icon names)
        icon_name = "folder.gif" if is_dir else "text.gif"
        # build safe href and link HTML
        href = html.escape(e.name) + ("/" if is_dir else "")
        link_html = (
            f'<img src="/icons/{icon_name}" '
            f'alt="[{"DIR" if is_dir else "FILE"}]"> '
            f'<a href="{href}">{html.escape(display_name)}</a>'
        )
        mtime = apache_date(st.st_mtime)
        size = "-" if is_dir else apache_size(st.st_size)

        lines.append(entry_line(display_name, link_html, mtime, size))

    lines.append("<hr>\n")
    lines.append("</pre>\n")
    lines.append("</body></html>\n")
    return "".join(lines)


def main():
    target = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
    if not target.is_dir():
        print(f"Not a directory: {target}", file=sys.stderr)
        sys.exit(1)

    html_text = generate_fancyindex(target)
    outpath = target / "index.html"
    outpath.write_text(html_text, encoding="utf-8")
    print(f"Wrote {outpath}")


if __name__ == "__main__":
    main()
