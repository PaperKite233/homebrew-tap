#!/usr/bin/env python3
"""Check the latest stable tty7 release and bump Casks/tty7.rb if needed."""

import re
import sys
import urllib.request
from pathlib import Path

REPO = "l0ng-ai/tty7"
CASK = Path(__file__).resolve().parent / "Casks" / "tty7.rb"
LATEST = f"https://github.com/{REPO}/releases/latest"


def fetch(url):
    req = urllib.request.Request(url, headers={"User-Agent": "homebrew-formulas"})
    with urllib.request.urlopen(req) as r:
        return r.read().decode()


def latest_version():
    req = urllib.request.Request(LATEST, method="HEAD")
    with urllib.request.urlopen(req) as r:
        return r.geturl().rstrip("/").rsplit("/", 1)[-1].lstrip("v")


def main():
    version = latest_version()
    cask = CASK.read_text()
    current = re.search(r'version "([^"]+)"', cask).group(1)
    if version == current:
        print(f"tty7 already up to date: {version}")
        return

    base = f"https://github.com/{REPO}/releases/download/v{version}"
    shas = {
        name: digest
        for digest, name in (
            line.split() for line in fetch(f"{base}/checksums.txt").splitlines() if line
        )
    }

    if "sha256 arm:" in cask:
        cask = re.sub(
            r'sha256 arm: "[0-9a-f]{64}"',
            f'sha256 arm: "{shas[f"tty7-{version}-macos-arm64.dmg"]}"',
            cask,
        )
        cask = re.sub(
            r'sha256 intel: "[0-9a-f]{64}"',
            f'sha256 intel: "{shas[f"tty7-{version}-macos-x86_64.dmg"]}"',
            cask,
        )
    else:
        arch = re.search(r"macos-(\w+)\.dmg", cask).group(1)
        asset = f"tty7-{version}-macos-{arch}.dmg"
        if asset not in shas:
            sys.exit(f"no checksum found for {asset}")
        cask = re.sub(r'sha256 "[0-9a-f]{64}"', f'sha256 "{shas[asset]}"', cask, count=1)

    cask = re.sub(r'version "[^"]+"', f'version "{version}"', cask, count=1)
    CASK.write_text(cask)
    print(f"bumped tty7 to {version}")


if __name__ == "__main__":
    main()