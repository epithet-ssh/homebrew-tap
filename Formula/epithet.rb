class Epithet < Formula
  desc "SSH certificate management"
  homepage "https://epithet.dev/"
  version "0.8.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.8.1/epithet_0.8.1_darwin_arm64.tar.gz"
      sha256 "2beafa7ac42c4f2e350db4f6f5d75136204cae21673f7485cff48ebaa74b4de6"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.8.1/epithet_0.8.1_darwin_amd64.tar.gz"
      sha256 "2c4d1ffae19a9d7a48679c813815baca95017d1b19841dce074ba1906b6b9a6e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.8.1/epithet_0.8.1_linux_arm64.tar.gz"
      sha256 "544ffbad2ad7774e87eadb12f4386cd8f7b791b45cea2ef0ad4fff0e9702257f"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.8.1/epithet_0.8.1_linux_amd64.tar.gz"
      sha256 "77f16803a1c8fb4b07d10eab00a514181296a71b3f576294e13aefbfa7b714c2"
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
