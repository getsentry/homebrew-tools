class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.2.3"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.2.3/sentry-cli-Darwin-universal"
    sha256 "18cccf84e61cb9377455ed8d81bf99051eb809f3af0a8f69c045ab1712decc8e"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.2.3/sentry-cli-Linux-aarch64"
        sha256 "87ae77844eb024ee51c9917234d605b6cfb23716c367c5b84c3d7f2e9ece2217"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.2.3/sentry-cli-Linux-armv7"
        sha256 "6f01ebc30bbc4dd62c44bf58a92355f4977201dbf7bb4520196057d37d2aa3c3"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.2.3/sentry-cli-Linux-x86_64"
        sha256 "1c6d8e4471d73d17b96a6c9a1860299d1aadb2e96276471c8b04424c88ac1e58"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.2.3/sentry-cli-Linux-i686"
        sha256 "9863344c25e87055e29f8fb81a531844429126df84055812be566fba6f231b86"
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
