cat << 'EOF' > /opt/homebrew/Library/Taps/matznerdigital/homebrew-mdigi/Casks/p/presenton.rb
cask "presenton" do
  version "0.9.11-beta"

  on_arm do
    sha256 :no_check
    url "https://github.com{version}/Presenton-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 :no_check
    url "https://github.com{version}/Presenton-#{version}-x64.dmg"
  end

  name "Presenton"
  desc "Open-source AI presentation generator"
  homepage "https://presenton.ai"

  livecheck do
    url :url
    strategy :github_latest
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
EOF

