cask "epithet-agent-mac" do
  version "0.6.3"
  sha256 "12ce190aa8ae2d2cd47f279cba44d40dc72c0d01fe886376c91f72d0582d5121"

  url "https://github.com/epithet-ssh/epithet-macos/releases/download/v#{version}/EpithetAgent-#{version}.dmg"
  name "Epithet Agent"
  desc "SSH certificate management desktop app"
  homepage "https://github.com/epithet-ssh/epithet-macos"

  app "EpithetAgent.app"
end
