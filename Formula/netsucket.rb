class Netsucket < Formula
  desc "A dynamic port monitoring tool that listens for connections and proxies traffic between a client and the tunnel."
  homepage "https://github.com/kurianoff/netsucket"
  version "0.0.4"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/kurianoff/netsucket/releases/download/v#{version}/netsucket-darwin-arm64"
    sha256 "YOUR_ARM64_SHA256_CHECKSUM_HERE"
  else
    url "https://github.com/kurianoff/netsucket/releases/download/v#{version}/netsucket-darwin-amd64"
    sha256 "YOUR_AMD64_SHA256_CHECKSUM_HERE"
  end

  def install
    bin.install "netsucket-#{Hardware::CPU.arm? ? "darwin-arm64" : "darwin-amd64"}" => "netsucket"
  end

  test do
    assert_match "netsucket version v#{version}", shell_output("#{bin}/netsucket --version")
  end
end

