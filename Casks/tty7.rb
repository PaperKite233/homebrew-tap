cask "tty7" do
  version "26.8.3"
  sha256 "a9856c48767e439fb7fffa3a6b4c2900ce8f537944c35f555b07dd822b9e04aa"

  url "https://github.com/l0ng-ai/tty7/releases/download/v#{version}/tty7-#{version}-macos-arm64.dmg"
  name "tty7"
  desc "Terminal emulator"
  homepage "https://github.com/l0ng-ai/tty7"

  depends_on :macos

  app "tty7.app"
end
