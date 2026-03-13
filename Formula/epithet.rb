class Epithet < Formula
  desc "SSH certificate management"
  homepage "https://epithet.dev/"
  version "0.12.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.12.0/epithet_0.12.0_darwin_arm64.tar.gz"
      sha256 "74fae2f6268f82e29fe3a11d1131f2f3f7aaa78704e096f49eb640c40289c674"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.12.0/epithet_0.12.0_darwin_amd64.tar.gz"
      sha256 "eee283dc9f53b2b68ec2917c20f0b635b928a084cdc9a3b2fe5f01c6e4298fd6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.12.0/epithet_0.12.0_linux_arm64.tar.gz"
      sha256 "5d5157d59fd1c6a4b219533318fe05191de0e8fe663ec1e57520294ec16332a4"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.12.0/epithet_0.12.0_linux_amd64.tar.gz"
      sha256 "8d3b83d6ad9ccef7d8af4b27dc39c373c0f038097e852057ae64d580953fc6fc"
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
