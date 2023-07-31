class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.20.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.20.2/sentry-cli-Darwin-universal"
    sha256 "5a81c086fe0ffd7ec80b84e97b15e5907c8309f56b2ccccfdd9c3f622a7cd45f"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.2/sentry-cli-Linux-aarch64"
        sha256 "7e8c68c12547ad26c9f8aa342804c7c5763680d7b2a351a14c8320fe495d29b4"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.2/sentry-cli-Linux-armv7"
        sha256 "a7ff30720a915984ff382ca30fe502191f0dada3915331bec5f725b42e7f6f44"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.2/sentry-cli-Linux-x86_64"
        sha256 "52c366c04965a3bcdcc8e1cd36ce9d86a635d0f8dc336bba00dbaaa7169f0ed9"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.2/sentry-cli-Linux-i686"
        sha256 "6fdc3b8612ab8b71fe2e8379bae8e3db64cff8a32b8f920fa22f14c98233dc3b"
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
