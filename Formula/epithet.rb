class Epithet < Formula
  desc "SSH certificate management"
  homepage "https://epithet.dev/"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.5.0/epithet_0.5.0_darwin_arm64.tar.gz"
      sha256 "fe0c55512e535cbae139c34e80a385c7ca2c8cd9512c6acfa4ece433ff00fd17"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.5.0/epithet_0.5.0_darwin_amd64.tar.gz"
      sha256 "8300aeae68faf37f9e8b0843fcfdd9994b6f4538439d468b79b28385ff4a4314"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.5.0/epithet_0.5.0_linux_arm64.tar.gz"
      sha256 "0e5074a12839e8e3e2c0af7298f4a4d69028bd8c40ea1526aaeaafc9ad9b4954"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.5.0/epithet_0.5.0_linux_amd64.tar.gz"
      sha256 "f9a1fc5c8a7f5e7d09b38fbaf4205cdfbbb349a2c16ae8ef5a2ecbb08a376779"
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
