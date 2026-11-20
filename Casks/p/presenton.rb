cask "presenton" do
  arch arm: "arm64", intel: "x64"

  version "0.9.11-beta"
  sha256 :no_check

  url "https://github.com{version}/Presenton-#{version}-#{arch}.dmg",
      verified: "://github.com"
  name "Presenton"
  desc "Open-source AI presentation generator"
  homepage "https://presenton.ai"

  # Prüft automatisch auf neuere GitHub-Releases
  livecheck do
    url :url
    strategy :github_latest
  end

  app "Presenton.app"

  # Entfernt das macOS Quarantäne-Flag (Gatekeeper-Bypass), damit die App direkt startet
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Presenton.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Presenton",
    "~/Library/Preferences/ai.presenton.app.plist",
    "~/Library/Saved Application State/ai.presenton.app.savedState",
  ]
end

