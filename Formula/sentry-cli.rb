class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.39.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.39.1/sentry-cli-Darwin-universal"
    sha256 "5a104e2026580c9dad78628d99260d839831fb83d43c638a21e381dcfde9abd3"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.39.1/sentry-cli-Linux-aarch64"
        sha256 "e8ec5607a1be099d3981323b86dcea0c3b0ee6a8cd2becec4e4c51f1ab9ae366"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.39.1/sentry-cli-Linux-armv7"
        sha256 "24ccbd000e0e07badb844f106461272fe33b40e6d98fc23a37012d3df2eebcea"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.39.1/sentry-cli-Linux-x86_64"
        sha256 "c41aab845e32b40ee96054eec77e09385d26434808365ef20e876aff54f5df04"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.39.1/sentry-cli-Linux-i686"
        sha256 "bc35cb53201f65379b9538b1689778b9ebf969c1f1268e4b91ff84f01bf53cb3"
      end
    else
      raise "Unsupported architecture"
    end
  else
      raise "Unsupported operating system"
  end
  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
