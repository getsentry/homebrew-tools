class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.48.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.48.0/sentry-cli-Darwin-universal"
    sha256 "583fe0f18651e219969f0a47698b522354b0ac0fb296764c67ea36850a99d39d"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.48.0/sentry-cli-Linux-aarch64"
        sha256 "61ed4b287492919fb30bd96511169650a88c5004f31fcce5490541b8e0d4d4bf"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.48.0/sentry-cli-Linux-armv7"
        sha256 "672049db50efd2cf28d0172cea8aff670f6f16b31a0444dc471209df1c6c0578"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.48.0/sentry-cli-Linux-x86_64"
        sha256 "fdb0ee7a426cdd1b1bbae35ff4835af6fa55f0647fe558c7e8705df61b279f30"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.48.0/sentry-cli-Linux-i686"
        sha256 "fbad1830295a11697d3c0ee9d17819bd35872bf86539d719795afb79ba4137fd"
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
