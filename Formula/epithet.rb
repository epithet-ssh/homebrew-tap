class Epithet < Formula
  desc "SSH certificate management"
  homepage "https://epithet.dev/"
  url "https://github.com/epithet-ssh/epithet/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "1be012d082f5f2ca2a7e3ac042dc52438e91a0bf0ffa92f3f52e22ca94b5085c"
  license "Apache-2.0"
  head "https://github.com/epithet-ssh/epithet.git"

  depends_on "go" => :build

  def install
    system "make", "epithet"
    bin.install "epithet"
    (share/"epithet").install "examples/client/.epithet/config" => "config.example"
  end

  def post_install
    (Dir.home/".epithet").mkpath
    (Pathname.new(Dir.home)/"Library/logs/dev.epithet").mkpath

    config_example = share/"epithet/config.example"
    target = Pathname.new(Dir.home)/".epithet/config.example"
    cp config_example, target unless target.exist?
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
