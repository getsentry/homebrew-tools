class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.34.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.34.1/sentry-cli-Darwin-universal"
    sha256 "47557d56cdf17cd3b428d37c2642dc0cf9ed7a159f754d2a5810b52f04e98a64"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.34.1/sentry-cli-Linux-aarch64"
        sha256 "884205693031f9c3d574ca5d41ada9f8cd3bac4402baf8e3013293d13fa2d450"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.34.1/sentry-cli-Linux-armv7"
        sha256 "3775794675ba02af930766966b57e0fdd67ae5ff15ae266f5bc5169002d462db"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.34.1/sentry-cli-Linux-x86_64"
        sha256 "55952c5804f0867ac4bbe9db52d99de5562cad8e3c0a617905b087f621237415"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.34.1/sentry-cli-Linux-i686"
        sha256 "53fa966e20ff024cbf5f26e7410a13d00fbc122fec6fc9d74c3daa96c87f63ff"
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
