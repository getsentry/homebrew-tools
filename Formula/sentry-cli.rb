class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.5.1"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.5.1/sentry-cli-Darwin-universal"
    sha256 "266169e1cefeca08834bf6e28b16822ce681fe35f6e5b20492683744c4fa0d7f"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.5.1/sentry-cli-Linux-aarch64"
        sha256 "1bd69e3258829a50548910eaa2422377dab2a1c25430ed783a55f28ea820a037"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.5.1/sentry-cli-Linux-armv7"
        sha256 "7f46111fef30e6abcafecf2b29fb76afcd192e507aaad87c5248686deaa90612"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.5.1/sentry-cli-Linux-x86_64"
        sha256 "50a1618336cdbb908e5559d6b941f3aa0ef5f341abeca08de40ed8c0070450b4"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.5.1/sentry-cli-Linux-i686"
        sha256 "d2048e825041af378a55be9122972ca5efcefea2aa093fa67d1c2833d4124a25"
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
