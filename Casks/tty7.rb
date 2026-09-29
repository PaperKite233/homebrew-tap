cask "tty7" do
  version "26.9.4"
  sha256 "052a06b3403a7ce1a304f3f9166b4b0ced91d3147b5807a4624299964dce1aec"

  url "https://github.com/l0ng-ai/tty7/releases/download/v#{version}/tty7-#{version}-macos-arm64.dmg"
  name "tty7"
  desc "Terminal emulator"
  homepage "https://github.com/l0ng-ai/tty7"

  depends_on :macos

  app "tty7.app"
end
