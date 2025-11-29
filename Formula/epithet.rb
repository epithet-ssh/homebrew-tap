class Epithet < Formula
  desc "SSH certificate management"
  homepage "https://epithet.dev/"
  url "https://github.com/epithet-ssh/epithet/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "01c8b0e29dfcf0795bcbff20cc67aba56e9e7050be0c2bd562dc2632457ddda5"
  license "Apache-2.0"
  head "https://github.com/epithet-ssh/epithet.git"

  depends_on "go" => :build

  def install
    system "make", "epithet"
    bin.install "epithet"
    (share/"epithet").install "examples/client/.epithet/config" => "config.example"
  end

  def caveats
    <<~EOS
      To complete setup, run:
        mkdir -p ~/.epithet ~/Library/logs/dev.epithet
        cp #{opt_share}/epithet/config.example ~/.epithet/

      Then start the agent:
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
