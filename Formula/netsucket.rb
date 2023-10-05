class Netsucket < Formula
  desc "Port monitoring tool that proxies traffic between a client and the tunnel"
  homepage "https://github.com/kurianoff/netsucket"
  version "0.0.5"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/kurianoff/netsucket/releases/download/v#{version}/netsucket-darwin-arm64"
    sha256 "b5dda0a1d702e38efb515b469f47cc6dddd5be9b56631720b5cb29fa4b7d44e5"
  else
    url "https://github.com/kurianoff/netsucket/releases/download/v#{version}/netsucket-darwin-amd64"
    sha256 "b6ca8f983a301c0c0b268dc3ea02ad46d5caa2a1e05ef525786022047a7606d9"
  end

  def install
    bin.install "netsucket-#{Hardware::CPU.arm? ? "darwin-arm64" : "darwin-amd64"}" => "netsucket"
  end

  test do
    assert_match "netsucket version v#{version}", shell_output("#{bin}/netsucket --version")
  end
end
