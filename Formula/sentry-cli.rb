class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.20.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.20.0/sentry-cli-Darwin-universal"
    sha256 "ffb7bfb921b8197bd4a1c55531174c558eecae1f795913e67784119ba1ca5c5f"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.0/sentry-cli-Linux-aarch64"
        sha256 "1af69abb121554f32119c146efbab71cf861babb2cc8b824c1b75f586feed0a3"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.0/sentry-cli-Linux-armv7"
        sha256 "5bdef08786551b1cae88d3cbf22778ebe212b5d1368013f1b39748910b287602"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.0/sentry-cli-Linux-x86_64"
        sha256 "20f9463929fdc0719e19c6bdb7fb7e12fdb91c9fbfe51f0354401e09adc562cb"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.0/sentry-cli-Linux-i686"
        sha256 "42c75f02f3fba243ec47031fff3254a25986ec9f93cedbf729148ba3046fd133"
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
