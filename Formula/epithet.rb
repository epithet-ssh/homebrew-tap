class Epithet < Formula
  desc "SSH certificate management"
  homepage "https://epithet.dev/"
  version "0.9.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.9.0/epithet_0.9.0_darwin_arm64.tar.gz"
      sha256 "8b8be6a2b972c8d121b70c1ed94ffa5e8319c3829c1aae6ec9d71121b374e1f6"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.9.0/epithet_0.9.0_darwin_amd64.tar.gz"
      sha256 "fdd130eb218d9cfc1eb3390039a25f7335f7ec82d78e0384eb2de3e3c7e02556"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.9.0/epithet_0.9.0_linux_arm64.tar.gz"
      sha256 "adfd32a0ea57da9e2bf396ae506d9e5cfb2174ba3d990904f813d1f600263265"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.9.0/epithet_0.9.0_linux_amd64.tar.gz"
      sha256 "f287b75e363b634a904bdaa9dbccd2fec142ac5dc17ef3f34f5e18cdcd1d1d3b"
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
