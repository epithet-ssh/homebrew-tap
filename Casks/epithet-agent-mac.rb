cask "epithet-agent-mac" do
  version "0.1.1"
  sha256 "a98b17274545d3b553a1a6e10abf9865de03c72b219bb0f09e22c9704ebf1a2f"

  url "https://github.com/epithet-ssh/epithet-macos/releases/download/v#{version}/EpithetAgent.dmg"
  name "Epithet Agent"
  desc "SSH certificate management desktop app"
  homepage "https://github.com/epithet-ssh/epithet-macos"

  app "EpithetAgent.app"
end
