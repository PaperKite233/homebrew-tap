# homebrew-tap

Personal Homebrew tap for software without official brew support.

## tty7

```sh
brew tap PaperKite233/tap
brew install --cask PaperKite233/tap/tty7
```

`Casks/tty7.rb` is bumped automatically by the GitHub Actions workflow
(`.github/workflows/update.yml`) whenever tty7 publishes a new stable release.
Run `brew upgrade --cask PaperKite233/tap/tty7` to update.