class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.21.5"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.21.5/sentry-cli-Darwin-universal"
    sha256 "bf3cbc83ed490f4bc4a75627f509a76f3d584ed16a539cd0aa9d9673d389e8a9"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.5/sentry-cli-Linux-aarch64"
        sha256 "74838d45d7915f1c9bc08b262a7cc57da8b1d597faa7d754aab4be8eb7af8e17"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.5/sentry-cli-Linux-armv7"
        sha256 "297373be79b59c843cea7a061b8fea5effb1707dacf8c6eb3140d8c09363676e"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.5/sentry-cli-Linux-x86_64"
        sha256 "6027f652fc3f9ad17a8b20df027d78dc458a1747db33657a4df0d9c9ba6d2ccd"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.5/sentry-cli-Linux-i686"
        sha256 "45038805edf469c20f9b1fcc5d2185aafe6c3f9540223265b8a78a0054742e0a"
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
