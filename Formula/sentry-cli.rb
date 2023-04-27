class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.75.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.75.1/sentry-cli-Darwin-universal"
    sha256 "6a577d92c364408b98a277b35d5f241d3d6f8146127a6870d68412bb0bdc6af0"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.75.1/sentry-cli-Linux-aarch64"
        sha256 "fec036af14dda4c6b90edb876b741c6b8ec5a890fae71d75f4634b273bdbe908"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.75.1/sentry-cli-Linux-armv7"
        sha256 "6883525fafc48325a35ebe18e74e7dd5102d57c140fb3be8891154795e3a637b"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.75.1/sentry-cli-Linux-x86_64"
        sha256 "f426f1fd14fa33c035439d6757ca84201252f5016a2eb0df1d896232d05ea62c"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.75.1/sentry-cli-Linux-i686"
        sha256 "9020b67b84ad54fde3b5de17afbdcbc46af1757d87fb5194430eed08605775ae"
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
