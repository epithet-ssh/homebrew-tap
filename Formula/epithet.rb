class Epithet < Formula
  desc "SSH certificate management"
  homepage "https://epithet.dev/"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.7.0/epithet_0.7.0_darwin_arm64.tar.gz"
      sha256 "ce7318fe186bd9b8788a2a2f3c8a42bb3576ed3ac4e049a36df75519e56b89c7"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.7.0/epithet_0.7.0_darwin_amd64.tar.gz"
      sha256 "9add59d89a6cdfd252c56ec521087251c9dddccdf61a4622b8d63e16f18a01ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.7.0/epithet_0.7.0_linux_arm64.tar.gz"
      sha256 "3f7c64576914f1c29346b4c8f5a8e930f6aacbc513733b299174b7667c84f089"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.7.0/epithet_0.7.0_linux_amd64.tar.gz"
      sha256 "ee25a947e2e0a1f979556a5126af72cb0b5a9e1f8b553925f600e4784fedee99"
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
