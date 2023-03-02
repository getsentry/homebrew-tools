class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.14.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.14.2/sentry-cli-Darwin-universal"
    sha256 "8f9c96cab33eccff664fdab9cad8e5485bc9c2c7b36018797efca7fa7d78dff0"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.14.2/sentry-cli-Linux-aarch64"
        sha256 "25add6643898a589510a217ab8aeaa15a2c09cd21bb59580a1c1652f97ebc34a"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.14.2/sentry-cli-Linux-armv7"
        sha256 "3468ad8b0c711f1c14daf3d6b38dfe5389395e24c30984012b0bb5586cdc5129"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.14.2/sentry-cli-Linux-x86_64"
        sha256 "755c657f8ac687d22b02a1328547f3954bc5d53e682c87ae791dc36e225818ea"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.14.2/sentry-cli-Linux-i686"
        sha256 "b5d93c87b108d2aa703003d90107e6ac1e097f26e6767560e2e2f8855a727885"
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
