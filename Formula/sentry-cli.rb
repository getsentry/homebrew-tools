class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.0.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.0.1/sentry-cli-Darwin-universal"
    sha256 "4ded776b94d1c1e26fbb9e8811fdf003e7f51116bd4720e627a3bc2b9a814e74"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.1/sentry-cli-Linux-aarch64"
        sha256 "d05bf0aba980795fb046c62a693bd6c152421de1f85c1c851f94e206cabbe62f"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.1/sentry-cli-Linux-armv7"
        sha256 "3e64b3b61dca0cae6c6845dfbfe7ec19a208cc04480ec1dca5a343d2a5a8f3f5"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.1/sentry-cli-Linux-x86_64"
        sha256 "4f378d823e03a40560cb0438b3eb3ee54ea828aff6087a9ef63dfeb31fb064ab"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.1/sentry-cli-Linux-i686"
        sha256 "2ac8358c52f5a8936bade1729fb85e3b8be604d60bd195f88609cb44e6fb8f06"
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
