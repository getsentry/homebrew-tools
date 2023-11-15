class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.77.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.77.1/sentry-cli-Darwin-universal"
    sha256 "1f1abe664a476b4488e018f1db775cb663aed3beb26a7a1a074346759277a935"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.77.1/sentry-cli-Linux-aarch64"
        sha256 "e60603e05bad2a3449e6a18f5bc7d38525762faf32c99ed95bd95d7c5e13225e"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.77.1/sentry-cli-Linux-armv7"
        sha256 "5a30a376de811641edbad5bffe1227cd6186c43fedcc5c544269c4bc0f80acff"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.77.1/sentry-cli-Linux-x86_64"
        sha256 "79ca22a21cb4932f12658f687f931899fa994248d3833957870a172350a4a4f0"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.77.1/sentry-cli-Linux-i686"
        sha256 "44b2ea8ceb3bda57b6925316fb738892e8d84578802dfee0d1c481e4f0730826"
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
