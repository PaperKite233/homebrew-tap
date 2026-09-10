cask "tty7" do
  version "26.9.2"
  sha256 "4d28a62a1a678d1e7e4bb37db5a93649fe3001ea065ab683627f4809cc77603a"

  url "https://github.com/l0ng-ai/tty7/releases/download/v#{version}/tty7-#{version}-macos-arm64.dmg"
  name "tty7"
  desc "Terminal emulator"
  homepage "https://github.com/l0ng-ai/tty7"

  depends_on :macos

  app "tty7.app"
end
