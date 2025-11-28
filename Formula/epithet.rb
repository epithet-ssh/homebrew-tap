$pkg_tag = "v0.1.5"
$pkg_group = "epithet-ssh"
$pkg_repo = "epithet"

class Epithet < Formula
  desc "SSH certificate management"
  homepage "https://epithet.dev/"

  head "https://github.com/#{$pkg_group}/#{$pkg_repo}.git"
  url "https://github.com/#{$pkg_group}/#{$pkg_repo}/archive/refs/tags/#{$pkg_tag}.tar.gz"

  sha256 "17d3668763a39eed809c10e09786f9c5edf2a9059dd87884003eb2abc6fe4f3e"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "make epithet"
    bin.install "epithet"
  end

  test do
    system "#{bin}/epithet", "--version"
  end
end
