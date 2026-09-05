cask "tty7" do
  version "26.9.0"
  sha256 "d232c33be59a909addffa4cdb47902d87f93f586f41572a1cebb9f86716cf5ec"

  url "https://github.com/l0ng-ai/tty7/releases/download/v#{version}/tty7-#{version}-macos-arm64.dmg"
  name "tty7"
  desc "Terminal emulator"
  homepage "https://github.com/l0ng-ai/tty7"

  depends_on :macos

  app "tty7.app"
end
