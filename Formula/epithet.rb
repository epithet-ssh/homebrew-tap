class Epithet < Formula
  desc "SSH certificate management"
  homepage "https://epithet.dev/"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.4.0/epithet_0.4.0_darwin_arm64.tar.gz"
      sha256 "7fff0eab6a4855c54716e7c3f6e372dc253eb77051391bbbbb4ea03c9430a295"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.4.0/epithet_0.4.0_darwin_amd64.tar.gz"
      sha256 "385e149ac15f76843fabdb209b3ccdc4f9692a4c70f7fdbbe07aa9b2f278183b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.4.0/epithet_0.4.0_linux_arm64.tar.gz"
      sha256 "193fb1d0b793b85a739c9207f6188aaf16d3198ec53bd46c5f6f75f6c029c5ea"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.4.0/epithet_0.4.0_linux_amd64.tar.gz"
      sha256 "382391f8b4cf570cb57079149649d029b70b74455ba940b28fcb423a724b44f5"
    end
  end

  def install
    bin.install "epithet"
  end

  def caveats
    <<~EOS
      To start the agent:
        brew services start epithet
    EOS
  end

  service do
    run [opt_bin/"epithet", "--log-file=#{Dir.home}/Library/logs/dev.epithet/agent.log", "agent"]
    keep_alive true
    process_type :background
  end

  test do
    system "#{bin}/epithet", "--version"
  end
end
