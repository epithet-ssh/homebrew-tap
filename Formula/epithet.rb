class Epithet < Formula
  desc "SSH certificate management"
  homepage "https://epithet.dev/"
  version "0.5.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.5.2/epithet_0.5.2_darwin_arm64.tar.gz"
      sha256 "4f8a735f6e7630e0778bfe991963e166e3d6c0561fcae3e40025bca86f8bd0c1"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.5.2/epithet_0.5.2_darwin_amd64.tar.gz"
      sha256 "b378b833699fd1f73c7aa8231c18f306f8a728b61bad21e3d96efc0b1fc29537"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.5.2/epithet_0.5.2_linux_arm64.tar.gz"
      sha256 "16670cd606def9c5b0267e0a7f703dfa764c9780850cc445c200da0cfcef58f4"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.5.2/epithet_0.5.2_linux_amd64.tar.gz"
      sha256 "f3d9a26d5dafbf4b3cd9552d1ebf7eeefd56e536cd045c1c6fdf79ad669edc65"
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
