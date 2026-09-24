cask "tty7" do
  version "26.9.3"
  sha256 "c965605a46946e749f26ef0a0e2d9c410c31ff58c22b972e39870bb40e4aff84"

  url "https://github.com/l0ng-ai/tty7/releases/download/v#{version}/tty7-#{version}-macos-arm64.dmg"
  name "tty7"
  desc "Terminal emulator"
  homepage "https://github.com/l0ng-ai/tty7"

  depends_on :macos

  app "tty7.app"
end
