class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.21.4"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.21.4/sentry-cli-Darwin-universal"
    sha256 "f23634d75c8d1bc3795b5bd51e37a5cb54d3384d28fca9a5d689c92108c81504"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.4/sentry-cli-Linux-aarch64"
        sha256 "73f2c494c8d2c70b787993eedb0b31c9741c19381bd340081457ab386c4b646f"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.4/sentry-cli-Linux-armv7"
        sha256 "49ad9690e5277c4a4927cbbf0564addd0bd3d12d31358d13f32c0d72a8390ecb"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.4/sentry-cli-Linux-x86_64"
        sha256 "1dfd60c8c26a68bc42f612bef19655c86de0b0e291813d02b1498506e36f1bed"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.4/sentry-cli-Linux-i686"
        sha256 "3cb5f769281ceb64b3524cc27268de3786afd4dd9bbfe3ab4f0f499faa79e746"
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
