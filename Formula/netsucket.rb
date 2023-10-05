class Netsucket < Formula
  desc "Port monitoring tool that proxies traffic between a client and the tunnel"
  homepage "https://github.com/kurianoff/netsucket"
  version "0.0.6"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/kurianoff/netsucket/releases/download/v#{version}/netsucket-darwin-arm64"
    sha256 "8b3f457dd91fb8cb7f8d68e28a09e542c732846e07c0d946e1a7e0511512d21d"
  else
    url "https://github.com/kurianoff/netsucket/releases/download/v#{version}/netsucket-darwin-amd64"
    sha256 "eaebdc0989449f1538c803dacd3799a2929a3156885ab41d10c02ba44f330f13"
  end

  def install
    bin.install "netsucket-#{Hardware::CPU.arm? ? "darwin-arm64" : "darwin-amd64"}" => "netsucket"
  end

  test do
    assert_match "netsucket version v#{version}", shell_output("#{bin}/netsucket --version")
  end
end
