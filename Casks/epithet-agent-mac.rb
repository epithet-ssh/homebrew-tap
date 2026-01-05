cask "epithet-agent-mac" do
  version "0.1.0"
  sha256 "09ad0929e48db42b576958eb1a4fe6f4facabe98b4649e75de1169fc190a8746"

  url "https://github.com/epithet-ssh/epithet-macos/releases/download/v#{version}/EpithetAgent.dmg"
  name "Epithet Agent"
  desc "SSH certificate management desktop app"
  homepage "https://github.com/epithet-ssh/epithet-macos"

  app "EpithetAgent.app"
end
