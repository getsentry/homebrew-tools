class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.74.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.74.1/sentry-cli-Darwin-universal"
    sha256 "2b9e05955732e7dd755434861b4db17e38b0364d29ce802106110d64fb53e9fa"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.1/sentry-cli-Linux-aarch64"
        sha256 "b381a73c74e4c29929ba6d70957aff76a7b0429e58372855435eab7eea232413"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.1/sentry-cli-Linux-armv7"
        sha256 "99b28af62b1122741df6bdca3121ba8db3dd9543d83db782ef671e832a7bc168"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.1/sentry-cli-Linux-x86_64"
        sha256 "a35150e09767005879f182ad85cf00424a7ac13e8b232bd5b23834a8f7e9d9f6"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.1/sentry-cli-Linux-i686"
        sha256 "46ad4fe52141ee25f3954fb9abf4a4b9c03796f76b0b5f7cbbd973cb6bca78d2"
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
