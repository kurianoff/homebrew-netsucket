class Netsucket < Formula
  desc "Port monitoring tool that proxies traffic between a client and the tunnel"
  homepage "https://github.com/kurianoff/netsucket"
  version "0.0.8"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/kurianoff/netsucket/releases/download/v#{version}/netsucket-darwin-arm64"
    sha256 "72ccab71ec10113ae0c4f10e46e12778d8f66f2b042f67b47a1a460d784e7a36"
  else
    url "https://github.com/kurianoff/netsucket/releases/download/v#{version}/netsucket-darwin-amd64"
    sha256 "5641c976b195cf08fbb9d03094cf96157ca8ad85f1844464725080b8a48caa85"
  end

  def install
    bin.install "netsucket-#{Hardware::CPU.arm? ? "darwin-arm64" : "darwin-amd64"}" => "netsucket"
  end

  test do
    assert_match "netsucket version v#{version}", shell_output("#{bin}/netsucket --version")
  end
end
