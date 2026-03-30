class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.3.5"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.3.5/sentry-cli-Darwin-universal"
    sha256 "92a8672a36a885124e0fa688d9f146520a237c9a6b8b780037d6817a0b81b263"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.5/sentry-cli-Linux-aarch64"
        sha256 "a7ed9089f28466ee830219100f70b6f13e9a7a7d03d54f9840e9b84436468661"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.5/sentry-cli-Linux-armv7"
        sha256 "ab9ce8f6babb789d210298beaac7324a29f256ef8192654cd3a434e0312d2523"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.5/sentry-cli-Linux-x86_64"
        sha256 "81bda3da764c957cdc9ddc6d368f9a2e1e4a1e385b6272180a0373830acaecdb"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.5/sentry-cli-Linux-i686"
        sha256 "40c892f02bea9049914ce058530a7a947a06b8ad1072c9c466978932e9077ecd"
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
