class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.51.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.51.0/sentry-cli-Darwin-universal"
    sha256 "327498ca95237edc5eb6a0e666522f626922456c09298927ca201a13b3c824e4"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.51.0/sentry-cli-Linux-aarch64"
        sha256 "6d7796308920458ee8c41f84b64e369e13214357924a10a5fcc1d5797cbca0f5"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.51.0/sentry-cli-Linux-armv7"
        sha256 "d1a7db9fd5a3277f46ba1d67fb1f0046321ee3aef292f7017b8f742af419de03"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.51.0/sentry-cli-Linux-x86_64"
        sha256 "507832f0f5066cb971119c2f4623b7adf32ee8013f4ffa90507ab93dbbcfc537"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.51.0/sentry-cli-Linux-i686"
        sha256 "e1a020db1a8f13dd72d4a3da906b5ce81c400112dc1b7852499d0d8f64d0232b"
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
