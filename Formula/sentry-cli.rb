class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.41.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.41.0/sentry-cli-Darwin-universal"
    sha256 "f27ae31637e41e68bd79bcb17d785e77256e2449bb6a914add7af3a55d83ea9a"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.41.0/sentry-cli-Linux-aarch64"
        sha256 "40e5a0f23e01cc1102fdd550badd860e669bc3e9e7d6bfdcaac47110489c1b74"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.41.0/sentry-cli-Linux-armv7"
        sha256 "8a8654630a8159ee177bedc40dd46b540ad53f0bbd9a226bf948cb5c9f2c7ae8"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.41.0/sentry-cli-Linux-x86_64"
        sha256 "dc9475a1cce1f5f5d8cd14803c2b1b1c73f4d4c9c804617b2950f7699740226a"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.41.0/sentry-cli-Linux-i686"
        sha256 "29e58e4935f238cf6cd66c32b8f0542d4ba40324d9dc95705df19e832e08784b"
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
