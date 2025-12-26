class Epithet < Formula
  desc "SSH certificate management"
  homepage "https://epithet.dev/"
  version "0.3.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.3.4/epithet_0.3.4_darwin_arm64.tar.gz"
      sha256 "fd0d72ac716024a3dacbfb18dc01b4f88c020cbeae16b06688b4fc0c408e8f9b"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.3.4/epithet_0.3.4_darwin_amd64.tar.gz"
      sha256 "67eb4658ca8a7191c7606fc27cbf7cb2e48a1988d1e51877534959ca67debdce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.3.4/epithet_0.3.4_linux_arm64.tar.gz"
      sha256 "f8781041c30c62b4522df1b8544499f19a7dd4dd21b0516ba8181d7e8868607e"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.3.4/epithet_0.3.4_linux_amd64.tar.gz"
      sha256 "779ba31ec516ffe538dd501684d8fc0afa6df9390acafe1b8b4bf6562db2209f"
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
