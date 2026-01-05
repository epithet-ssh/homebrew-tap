cask "epithet-agent-mac" do
  version "0.2.0"
  sha256 "19b5f7b211982a7b1d14a23e956b85a9a4e0fba64f976c6dd8f6560a6fd237e0"

  url "https://github.com/epithet-ssh/epithet-macos/releases/download/v#{version}/EpithetAgent.dmg"
  name "Epithet Agent"
  desc "SSH certificate management desktop app"
  homepage "https://github.com/epithet-ssh/epithet-macos"

  app "EpithetAgent.app"
end
