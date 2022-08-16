class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.5.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.5.1/sentry-cli-Darwin-universal"
    sha256 "fb3c4aa0f9dafff17d6687f7191bcba76cbc8c61cd7666edf941711b8f604af1"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.5.1/sentry-cli-Linux-aarch64"
        sha256 "9756883a60a6ff3a73ab934f065fbb4bf3010b3466bb27344f35238e0085d4ff"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.5.1/sentry-cli-Linux-armv7"
        sha256 "5574d4421a29abcc965fd9f2ecebe1f722d8bf1837d37f5f6e3b251dd884f2f5"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.5.1/sentry-cli-Linux-x86_64"
        sha256 "90930c68da46079a7e9a5f0d147c737e33097ee0b701a3526984426475603cf6"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.5.1/sentry-cli-Linux-i686"
        sha256 "b0dc3b075d008e962735afa5e08a92b581f8a61fa694599ee4ab36dfe9c17cb8"
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
