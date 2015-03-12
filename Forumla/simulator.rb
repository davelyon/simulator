class Simulator < Formula
  homepage "https://github.com/davelyon/simulator"
  url "https://github.com/davelyon/simulator/archive/v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "c24567fc09d43bc49fb0105b82d61dde970a7a3f3656c25c1f3fe379b704bf51"


  def install
    bin.install "get-device.awk", "pretty-list.awk", "simulator"
    prefix.install "LICENSE", "README.md"
  end

  test do
  end
end
