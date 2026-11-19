cask "gonavi" do
  arch arm: "Arm64", intel: "Amd64"

  version "1.2.3"
  sha256 arm:   "e800c10be0504493fa25aa2b9123c805fd70990a051cfcf23178018114e49e12",
         intel: "1c81125d47e71cb34b78e0dd4cca4548d587f41709856db4fd62a21ae4f4d2e9"

  url "https://github.com/Syngnat/GoNavi/releases/download/v#{version}/GoNavi-#{version}-MacOS-#{arch}.dmg"
  name "GoNavi"
  desc "Multi-data-source database client with AI and MCP support"
  homepage "https://gonavi.org/"

  depends_on :macos

  app "GoNavi.app"

  zap trash: [
    "~/.gonavi",
    "~/Library/Application Support/com.wails.GoNavi",
    "~/Library/Caches/com.wails.GoNavi",
    "~/Library/HTTPStorages/com.wails.GoNavi",
    "~/Library/Preferences/com.wails.GoNavi.plist",
    "~/Library/Saved Application State/com.wails.GoNavi.savedState",
    "~/Library/WebKit/com.wails.GoNavi",
  ]
end
