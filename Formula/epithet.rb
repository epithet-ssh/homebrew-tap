class Epithet < Formula
  desc "SSH certificate management"
  homepage "https://epithet.dev/"
  version "0.6.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.6.1/epithet_0.6.1_darwin_arm64.tar.gz"
      sha256 "e24838eabc2a217113df1dffc8887ad734042f696b3699eb021ae5ab54fb4c0e"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.6.1/epithet_0.6.1_darwin_amd64.tar.gz"
      sha256 "354f4c361b391a9d33f420e1e125d424e883bced26ed336cfe8b58ad0b6af11a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.6.1/epithet_0.6.1_linux_arm64.tar.gz"
      sha256 "e968931952e628e45c0cd0a0b313415e656b82e414a1699fc80bb1bd8216344a"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.6.1/epithet_0.6.1_linux_amd64.tar.gz"
      sha256 "d5fc51e36e4360829263ebe58a409e29a4789d504ec0dc95a509bffe7ae5dc86"
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
    system bin/"epithet", "--version"
  end
end
