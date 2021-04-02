class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.63.2"
  license "BSD-3-Clause"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.63.2/sentry-cli-Darwin-universal"
    sha256 "296c7a1c135682075f78b6991849b79fd117314d9b639127a018c01a0dc63445"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.63.2/sentry-cli-Linux-aarch64"
        sha256 "918ed34a59a15936af0d2c03b20f20d2b99a65caafb6f5614268a0bf93a22293"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.63.2/sentry-cli-Linux-armv7"
        sha256 "3ceeba3d62b0bb93723230caf9e9ddaa8d01629f63d12eb9a1dab65a59b909a8"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.63.2/sentry-cli-Linux-x86_64"
        sha256 "3386d1ab658980eff86ded2e9e1b75521ed45f5e979b37ca086d60480d7ce99d"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.63.2/sentry-cli-Linux-i686"
        sha256 "7cd414c0ab144d94609c1322c05c0e9ee24c20699a91350051d7564b9348495c"
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
