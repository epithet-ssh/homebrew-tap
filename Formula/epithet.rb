class Epithet < Formula
  desc "SSH certificate management"
  homepage "https://epithet.dev/"
  version "0.12.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.12.2/epithet_0.12.2_darwin_arm64.tar.gz"
      sha256 "83776fee232a466f44a69c6b0cccae0737236aafe14033c36a4052495107e638"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.12.2/epithet_0.12.2_darwin_amd64.tar.gz"
      sha256 "70a95b17e68b2d79254917175657ecb8a8d5a0505d77bc748afd178b08f07580"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.12.2/epithet_0.12.2_linux_arm64.tar.gz"
      sha256 "ac26aff4b71a25c259948b125160aa1017c370612011b5e91d6bd5661c239298"
    else
      url "https://github.com/epithet-ssh/epithet/releases/download/v0.12.2/epithet_0.12.2_linux_amd64.tar.gz"
      sha256 "bc13093b1cb1aa419e6ebc7bae864445f42b0a2c92f5fcfa3309bf0fb06eaf5a"
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
