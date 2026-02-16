cask "epithet-agent-mac" do
  version "0.9.0"
  sha256 "0219185501daf0f4a6f7df7e76236c8e230c4888d85b8cc88668956dfd80475e"

  url "https://github.com/epithet-ssh/epithet-macos/releases/download/v#{version}/EpithetAgent-#{version}.dmg"
  name "Epithet Agent"
  desc "SSH certificate management desktop app"
  homepage "https://github.com/epithet-ssh/epithet-macos"

  app "EpithetAgent.app"
end
