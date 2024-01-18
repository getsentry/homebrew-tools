class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.25.3"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.25.3/sentry-cli-Darwin-universal"
    sha256 "95cce60ef8d3169e6f45be9167270bc0fd5c0e8263997a04b5ae7f9e6e582933"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.25.3/sentry-cli-Linux-aarch64"
        sha256 "ed880c3c65dac1e5d97ed7de2f972e85ec02dcfef38a9b0a46813e1df2322114"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.25.3/sentry-cli-Linux-armv7"
        sha256 "15d82a12e249b991e6937169e989c20d36b3f0e7b6b89bf20d8bd2fcf690a6d9"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.25.3/sentry-cli-Linux-x86_64"
        sha256 "90a0d5a507e445687cece0b1424d32ca2709faef8dce9ad78537b4529a0d2d45"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.25.3/sentry-cli-Linux-i686"
        sha256 "74295eef544e463ac54da70c1db5b36d24ea356c6209aaa71e1609f247e0f449"
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
