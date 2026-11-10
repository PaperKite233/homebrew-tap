cask "gonavi" do
  arch arm: "Arm64", intel: "Amd64"

  version "1.2.2"
  sha256 arm:   "eea12709a8a4711e4017570c68b7b355d927af74248830f484b80cdf73d14f3f",
         intel: "9eb704e62f9b8547f6497c4727019add32a2cd543c6328b0886b0773f255ce25"

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
