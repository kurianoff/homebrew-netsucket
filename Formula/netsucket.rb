class Netsucket < Formula
  desc "A dynamic port monitoring tool that listens for connections and proxies traffic between a client and the tunnel."
  homepage "https://github.com/kurianoff/netsucket"
  version "0.0.4"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/kurianoff/netsucket/releases/download/v#{version}/netsucket-darwin-arm64"
    sha256 "34b408be8557907ca6857788da9fa3530dcc0e02c04ea6b127729d1881def150"
  else
    url "https://github.com/kurianoff/netsucket/releases/download/v#{version}/netsucket-darwin-amd64"
    sha256 "f27202a7449a153b463f9de698153b2b7c1a2d3bc8b6aaeae0274a131cf5236f"
  end

  def install
    bin.install "netsucket-#{Hardware::CPU.arm? ? "darwin-arm64" : "darwin-amd64"}" => "netsucket"
  end

  test do
    assert_match "netsucket version v#{version}", shell_output("#{bin}/netsucket --version")
  end
end

