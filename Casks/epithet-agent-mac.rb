cask "epithet-agent-mac" do
  version "0.6.2"
  sha256 "0d1b8b47580b1ea29282377680597a6c8f647e0f852e2a04a4a1fb1c2f339e59"

  url "https://github.com/epithet-ssh/epithet-macos/releases/download/v#{version}/EpithetAgent.dmg"
  name "Epithet Agent"
  desc "SSH certificate management desktop app"
  homepage "https://github.com/epithet-ssh/epithet-macos"

  app "EpithetAgent.app"
end
