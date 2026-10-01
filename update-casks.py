#!/usr/bin/env python3
"""Update AyuGram and Min casks from their latest GitHub releases."""

import hashlib
import json
import os
import re
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parent
HEADERS = {
    "Accept": "application/vnd.github+json",
    "User-Agent": "paperkite233-homebrew-tap",
    "X-GitHub-Api-Version": "2022-11-28",
}
if token := os.environ.get("GITHUB_TOKEN"):
    HEADERS["Authorization"] = f"Bearer {token}"


def request(url):
    return urllib.request.urlopen(urllib.request.Request(url, headers=HEADERS))


def latest_release(repository):
    with request(f"https://api.github.com/repos/{repository}/releases/latest") as response:
        return json.load(response)


def asset_url(release, name):
    for asset in release["assets"]:
        if asset["name"] == name:
            return asset["browser_download_url"]
    raise RuntimeError(f"release asset not found: {name}")


def sha256(url):
    digest = hashlib.sha256()
    with request(url) as response:
        while chunk := response.read(1024 * 1024):
            digest.update(chunk)
    return digest.hexdigest()


def replace(pattern, replacement, text):
    updated, count = re.subn(pattern, replacement, text, count=1, flags=re.MULTILINE)
    if count != 1:
        raise RuntimeError(f"expected one match for {pattern!r}, found {count}")
    return updated


def update_ayugram():
    path = ROOT / "Casks" / "ayugram.rb"
    text = path.read_text()
    release = latest_release("AyuGram/AyuGramDesktop")
    version = release["tag_name"].removeprefix("v")
    current = re.search(r'^  version "([^"]+)"', text, re.MULTILINE).group(1)
    if version == current:
        print(f"ayugram already up to date: {version}")
        return

    checksum = sha256(asset_url(release, "AyuGram.dmg"))
    text = replace(r'^  version "[^"]+"', f'  version "{version}"', text)
    text = replace(r'^  sha256 "[0-9a-f]{64}"', f'  sha256 "{checksum}"', text)
    path.write_text(text)
    print(f"updated ayugram: {current} -> {version}")


def update_min():
    path = ROOT / "Casks" / "min.rb"
    text = path.read_text()
    release = latest_release("minbrowser/min")
    version = release["tag_name"].removeprefix("v")
    current = re.search(r'^  version "([^"]+)"', text, re.MULTILINE).group(1)
    if version == current:
        print(f"min already up to date: {version}")
        return

    arm = sha256(asset_url(release, f"min-v{version}-mac-arm64.zip"))
    intel = sha256(asset_url(release, f"min-v{version}-mac-x86.zip"))
    text = replace(r'^  version "[^"]+"', f'  version "{version}"', text)
    text = replace(
        r'^  sha256 arm:\s+"[0-9a-f]{64}",\n\s+intel: "[0-9a-f]{64}"',
        f'  sha256 arm:   "{arm}",\n         intel: "{intel}"',
        text,
    )
    path.write_text(text)
    print(f"updated min: {current} -> {version}")


if __name__ == "__main__":
    update_ayugram()
    update_min()
