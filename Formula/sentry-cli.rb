class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.4.1"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.4.1/sentry-cli-Darwin-universal"
    sha256 "3a6196e6d05aae930db0de2ed7440f1da0a0b7e3a94f7fd980d03fad05cef33f"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.4.1/sentry-cli-Linux-aarch64"
        sha256 "72adfddd95ae4dabd4989f25f77db959949d430d96f601389254517c7dcf4b53"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.4.1/sentry-cli-Linux-armv7"
        sha256 "a0d9ee5d6c84adaa4418d3b96ed28e0d5eae08495734136b2c4a4a81ecb8bfb1"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.4.1/sentry-cli-Linux-x86_64"
        sha256 "479f0929275176a191a5a5dd6522853c9e5c21fb305fcdf3123721221b2935e2"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.4.1/sentry-cli-Linux-i686"
        sha256 "55c29ec42ed168de9b5260a3db9d300b699f690040ed97663bb54c20ea0295ed"
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
