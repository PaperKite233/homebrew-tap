cask "min" do
  arch arm: "arm64", intel: "x86"

  version "1.35.8"
  sha256 arm:   "3ddab5764188659ba354ee96db238cf776945658593dae5ad291dfca593fc1ad",
         intel: "b407f1a160656b9331c7c9a7e629c269f30a8581efd40740ba40a273205f8704"

  url "https://github.com/minbrowser/min/releases/download/v#{version}/min-v#{version}-mac-#{arch}.zip"
  name "Min"
  desc "Minimal browser that protects privacy"
  homepage "https://minbrowser.org/"

  livecheck do
    url "https://minbrowser.org/min/updates/latestVersion.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: :monterey

  app "Min.app"

  zap trash: [
    "~/Library/Application Support/Min",
    "~/Library/Caches/Min",
    "~/Library/Saved Application State/com.electron.min.savedState",
  ]
end
