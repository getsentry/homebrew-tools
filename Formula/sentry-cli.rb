class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.72.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.72.1/sentry-cli-Darwin-universal"
    sha256 "2a671f4a8e875e9c0a54002971c8e8f50e20b4c223cc64e3f0875a803a3337e4"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.72.1/sentry-cli-Linux-aarch64"
        sha256 "b846d27bd83be716b3e2f3c2bb536eba73337a26f55afc5a7606191bc3d6189a"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.72.1/sentry-cli-Linux-armv7"
        sha256 "b0b64d51ee653af9c1995017dc8f85c94910e0af354840fe708a43608a71514c"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.72.1/sentry-cli-Linux-x86_64"
        sha256 "e34b7f5e51064a29f1021d2d1ebd613fbc9668410cdca7424113871aeef8a0f0"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.72.1/sentry-cli-Linux-i686"
        sha256 "d8f6568932ea41e72ae50110cb190d4e5835b6d343b41ce8811af6157eda82d2"
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
