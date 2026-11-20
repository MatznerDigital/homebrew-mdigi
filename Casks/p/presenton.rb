cask "presenton" do
  version "0.9.11-beta"

  sha256 :no_check
  url "https://download.presenton.ai/#{version}/Presenton-#{version}.dmg"
  name "Presenton"
  desc "Open-source AI presentation generator"
  homepage "https://presenton.ai"
  
  livecheck do
    url "https://github.com"
    strategy :github_latest 
    regex(/electron-v?(\d+(?:\.\d+)+(?:-[a-z0-9]+)?)/i)
  end
     
  app "Presenton.app"
  
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
