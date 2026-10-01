# homebrew-tap

Personal Homebrew tap for software without official Homebrew support, or software
that is intentionally maintained outside the official cask repository.

## Install

```sh
brew tap PaperKite233/tap
brew install --cask PaperKite233/tap/tty7
brew install --cask PaperKite233/tap/ayugram
brew install --cask PaperKite233/tap/min
```

`ayugram` and `min` keep their original cask names. Always use their fully
qualified names when installing or upgrading them so Homebrew selects this tap
instead of the disabled official casks:

```sh
brew upgrade --cask PaperKite233/tap/ayugram PaperKite233/tap/min
```

These two applications currently do not pass macOS Gatekeeper checks. This tap
does not disable Gatekeeper or remove quarantine attributes. Review the upstream
release and approve each application through macOS only if you trust it.

The casks are checked daily by `.github/workflows/update.yml`. New upstream
versions and SHA-256 checksums are committed automatically.
