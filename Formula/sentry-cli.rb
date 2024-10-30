class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.38.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.38.1/sentry-cli-Darwin-universal"
    sha256 "c79989225f226b5c8af6b0f3515df9ae25afe6558bd8231d3b94e1fc40e1aa34"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.38.1/sentry-cli-Linux-aarch64"
        sha256 "ce056adc10cc15d16578d9d65cda98b1d1e97fca7fcc826772a13012495360e1"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.38.1/sentry-cli-Linux-armv7"
        sha256 "09c6f2b0589b64b2657a64806eeb44313f63637639cc986b39ceef64dcf10084"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.38.1/sentry-cli-Linux-x86_64"
        sha256 "6d5a4a2d93040fba4d9cf01b7abf5e43ffc0a013555ec2aab6a9d62fd5393ddb"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.38.1/sentry-cli-Linux-i686"
        sha256 "17f222d62e4ac2638198f646ab3e09e97ca879bd1c2fdaecad114737ad2b416f"
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
