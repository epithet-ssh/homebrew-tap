cask "epithet-agent-mac" do
  version "0.6.1"
  sha256 "d7c53d26a657a56fcf4baf83acce6a771f33ecd7b96e92b07ce6b6b7f55ae643"

  url "https://github.com/epithet-ssh/epithet-macos/releases/download/v#{version}/EpithetAgent.dmg"
  name "Epithet Agent"
  desc "SSH certificate management desktop app"
  homepage "https://github.com/epithet-ssh/epithet-macos"

  app "EpithetAgent.app"
end
