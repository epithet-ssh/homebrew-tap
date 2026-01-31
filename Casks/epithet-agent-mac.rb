cask "epithet-agent-mac" do
  version "0.7.0"
  sha256 "74868264f2e63fbaedb3e24a575dccc6db83fb0666da55b13973e2bb2d91a5a0"

  url "https://github.com/epithet-ssh/epithet-macos/releases/download/v#{version}/EpithetAgent-#{version}.dmg"
  name "Epithet Agent"
  desc "SSH certificate management desktop app"
  homepage "https://github.com/epithet-ssh/epithet-macos"

  app "EpithetAgent.app"
end
