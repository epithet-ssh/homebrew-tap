class Epithet < Formula
  desc "SSH certificate management"
  homepage "https://epithet.dev/"
  url "https://github.com/epithet-ssh/epithet/archive/refs/tags/v0.2.11.tar.gz"
  sha256 "cbb30f956be8ac00570e39ed2b5b9fa16edc6c074fbe7e47860d62c416c06fc7"
  license "Apache-2.0"
  head "https://github.com/epithet-ssh/epithet.git"

  depends_on "go" => :build

  def install
    system "make", "epithet"
    bin.install "epithet"
    (share/"epithet").install "examples/client/.epithet/config.yaml" => "config.yaml.example"
  end

  def caveats
    <<~EOS
      To complete setup, run:
        mkdir -p ~/.epithet ~/Library/logs/dev.epithet
        cp #{opt_share}/epithet/config.yaml.example ~/.epithet/config.yaml

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
