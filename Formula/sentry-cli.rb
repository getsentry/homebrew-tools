class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.72.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.72.0/sentry-cli-Darwin-universal"
    sha256 "429d3b9ba143b3e75ff7bec29e0b4aa19e428aa8ca1b9fc1ad524f6f17c4fcfc"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.72.0/sentry-cli-Linux-aarch64"
        sha256 "8555564d4f48356e481e30a0c1e9992b23d62ccc61dd7cab569994e568cb53c5"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.72.0/sentry-cli-Linux-armv7"
        sha256 "1c18c2e7e7181888372e08c618130b1b7aa0bb3476d4d35e5bf0b8a6c47aefbc"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.72.0/sentry-cli-Linux-x86_64"
        sha256 "9b16e9409d643a5ccbee5aca49578b6b964905555f8212630373982b88a9b272"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.72.0/sentry-cli-Linux-i686"
        sha256 "9f0d33635bbfeea77c2b205b0e25a40226ff15c9dec9d34aa6814cd12c5a3c60"
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
