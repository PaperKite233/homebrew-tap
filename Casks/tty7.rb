cask "tty7" do
  version "26.10.0"
  sha256 "afb33139b6f72b8a127856162a05921cb6fdcbfbeac0afc76abc6d6bdae25c62"

  url "https://github.com/l0ng-ai/tty7/releases/download/v#{version}/tty7-#{version}-macos-arm64.dmg"
  name "tty7"
  desc "Terminal emulator"
  homepage "https://github.com/l0ng-ai/tty7"

  depends_on :macos

  app "tty7.app"
end
