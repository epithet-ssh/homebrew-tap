class Epithet < Formula
  desc "SSH certificate management"
  homepage "https://epithet.dev/"
  version "0.6.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.6.3/epithet_0.6.3_darwin_arm64.tar.gz"
      sha256 "c0cc98cb4b6cfde4cd0af8770188a4aa7008a9f6c13a60bc34755160315470c3"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.6.3/epithet_0.6.3_darwin_amd64.tar.gz"
      sha256 "16aeb96dd3b6d91813b40dd4e5123559c57a8a4df7e8de005d0b1641447222d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.6.3/epithet_0.6.3_linux_arm64.tar.gz"
      sha256 "16c7c43344ca59e8731b43e905febf261790b39c68d23631bdf0e32d9032c425"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.6.3/epithet_0.6.3_linux_amd64.tar.gz"
      sha256 "2cb1fa315cfcd6464ceadeb6cc814e88823de010a489d0d49f7e21e7c1b31397"
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
