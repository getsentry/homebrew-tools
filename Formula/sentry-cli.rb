class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.3.1"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.3.1/sentry-cli-Darwin-universal"
    sha256 "b669f52acf34591bb35e20b9a62ed6da6263a078fa9d63b9a90a5ed0f55f497e"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.1/sentry-cli-Linux-aarch64"
        sha256 "285ff477764c0490dc77a599ac14660da84ff7d498610c168b382e40f2544612"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.1/sentry-cli-Linux-armv7"
        sha256 "305dfcb95dc42d5f8dffa943399af829f55c9b084b41c0fa2492e75a2d510f06"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.1/sentry-cli-Linux-x86_64"
        sha256 "cea078cdf7df91d75c9870f66514318506b3e9587a56aa06ac8dd4312b2db80e"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.1/sentry-cli-Linux-i686"
        sha256 "b0e7f2115e782f593e12f5b476a5459b392a15268c75f11aa3eb405451bec7b4"
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
