class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.44.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.44.0/sentry-cli-Darwin-universal"
    sha256 "73bb1d6e53a92a33bd31e473b419ed30d6b0e0618c320bc62ec50bf8bc5097a2"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.44.0/sentry-cli-Linux-aarch64"
        sha256 "98d98edc82c96c29e63175890e7b04077258bb109df98c826bc276fce367f292"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.44.0/sentry-cli-Linux-armv7"
        sha256 "c6d105d1b088a4e5115a18c96aa45a5379d05e845e0772f10f7c5fc7010de7b3"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.44.0/sentry-cli-Linux-x86_64"
        sha256 "1961fe5654a20541ed887880a705278c0913d63705c74b48f6835524ce415d1b"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.44.0/sentry-cli-Linux-i686"
        sha256 "a29e04547c2e6da315ab0b64e176f617e8aa13c323da3b250e960392047c0eb9"
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
