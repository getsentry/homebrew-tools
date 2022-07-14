class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.4.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.4.1/sentry-cli-Darwin-universal"
    sha256 "bc0c6198ddb0bcc4da7525e36876c205b7f9baaa7e7a2f5bb4ec6a553b065773"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.4.1/sentry-cli-Linux-aarch64"
        sha256 "d47b685a8eaca45fd9ca28c4d7fd182fa2c1b475d7617558ddf744033ee0a86b"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.4.1/sentry-cli-Linux-armv7"
        sha256 "07b73382dda9c4680e99806123ba6af9dfedac5419ef44f2c2318481bc0ace77"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.4.1/sentry-cli-Linux-x86_64"
        sha256 "2ce1ce0cc3bec9ab945be807df15697f618c737e12d67e935c8a45bd26117340"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.4.1/sentry-cli-Linux-i686"
        sha256 "dd296e660d5412db80a46d5d68acd3d4122d7f3503da626cda01f6191ce1a908"
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
