cask "epithet-agent-mac" do
  version "0.8.1"
  sha256 "fffffb8782723658f7fbbbe3c420313aba45ee02f7cc003023b4975fca4f815e"

  url "https://github.com/epithet-ssh/epithet-macos/releases/download/v#{version}/EpithetAgent-#{version}.dmg"
  name "Epithet Agent"
  desc "SSH certificate management desktop app"
  homepage "https://github.com/epithet-ssh/epithet-macos"

  app "EpithetAgent.app"
end
