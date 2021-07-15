class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.67.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.67.2/sentry-cli-Darwin-universal"
    sha256 "157419191de3992850f2b90217f102a78be64dd07dfa15c9a1409727c6f4f858"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.67.2/sentry-cli-Linux-aarch64"
        sha256 "6cf5ea357561601db7600978f691c4862186e1784548d76df18e7d995f53c956"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.67.2/sentry-cli-Linux-armv7"
        sha256 "7f3b13c6bfb8dca3f2ec516ec7e1ff21c427ec485e44630286e05412dac86355"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.67.2/sentry-cli-Linux-x86_64"
        sha256 "fca3ca4e18c17b31214a2dcfcbd590961ddaa0cfd02f443a0fb067432b703642"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.67.2/sentry-cli-Linux-i686"
        sha256 "10faa48d023881b2dc745fdfc1ef4aa55e8bd49e0b22c242c7234f818148ad73"
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
