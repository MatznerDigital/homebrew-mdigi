cask "ora" do
  arch arm: "Arm64"

  version "1.0.8"
  sha256 arm:   "sha256:af68044cc9a4ffed402624d9e99057ab8fbf5e4d009fe4b16ceff303a6117ffa"

  url "https://github.com/benedict2310/ora/releases/download/v#{version}/Ora-#{version}.dmg",
      verified: "https://github.com/benedict2310/ora/"
  name "Ora"
  desc "Privacy-first macOS voice assistant powered by on-device AI"
  homepage "https://github.com/benedict2310/ora"

  #depends_on macos: ">= :big_sur"

  app "Ora.app"

  # No zap stanza required
end
