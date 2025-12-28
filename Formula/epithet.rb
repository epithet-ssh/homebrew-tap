class Epithet < Formula
  desc "SSH certificate management"
  homepage "https://epithet.dev/"
  version "0.3.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.3.5/epithet_0.3.5_darwin_arm64.tar.gz"
      sha256 "164266a10b026f1f97d70938d187a6e4856383b3d20bc1b19b52b0deabd47ded"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.3.5/epithet_0.3.5_darwin_amd64.tar.gz"
      sha256 "c2ef95d3319fd78e53d7cef67ce3d0350544be50943c937ec3679080414d7937"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.3.5/epithet_0.3.5_linux_arm64.tar.gz"
      sha256 "2290055ca3788f23b00e9151d689379a145514bee6763f14a9810531ca25cf8a"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.3.5/epithet_0.3.5_linux_amd64.tar.gz"
      sha256 "65a76519615cc9ec8c00c17c11d9153cee38acb82b6f327e5d32683f8928061b"
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
