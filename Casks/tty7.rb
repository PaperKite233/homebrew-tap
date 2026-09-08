cask "tty7" do
  version "26.9.1"
  sha256 "4412fcde17ef96a8625cbe5a0988e23b4bf3d926fbd0113ef5fa693878bf7015"

  url "https://github.com/l0ng-ai/tty7/releases/download/v#{version}/tty7-#{version}-macos-arm64.dmg"
  name "tty7"
  desc "Terminal emulator"
  homepage "https://github.com/l0ng-ai/tty7"

  depends_on :macos

  app "tty7.app"
end
