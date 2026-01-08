class Epithet < Formula
  desc "SSH certificate management"
  homepage "https://epithet.dev/"
  version "0.6.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.6.2/epithet_0.6.2_darwin_arm64.tar.gz"
      sha256 "9186eaad7abb089dae9204904ee818cd698f19097c0bc1b680a56332a586841d"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.6.2/epithet_0.6.2_darwin_amd64.tar.gz"
      sha256 "a838b493224b37b0c3afd8a526b2799da5aaa19bda6da25c6ec8bd83bda1cd28"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.6.2/epithet_0.6.2_linux_arm64.tar.gz"
      sha256 "32f2064f256adc73820a26c3041510f9105937386d817f8b4a0fabca84314c59"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.6.2/epithet_0.6.2_linux_amd64.tar.gz"
      sha256 "2e156406cf6859b95ff884444e050928d9bbbb455637784d4339a99e1cd2782e"
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
