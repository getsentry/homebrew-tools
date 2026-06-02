class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.5.0"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.5.0/sentry-cli-Darwin-universal"
    sha256 "46a439a75a8dda4719dbfded7b09388dc4b2aa7e1976e28102dfeb14401b8587"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.5.0/sentry-cli-Linux-aarch64"
        sha256 "94c758dee171ba4f248c0514806c1a03331a59a59582874500f17555b922b257"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.5.0/sentry-cli-Linux-armv7"
        sha256 "bc036c910ab997ee92e519bd3aa8052ecf432298bf7eb0325d2f82fc9beae016"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.5.0/sentry-cli-Linux-x86_64"
        sha256 "522d469086996996322052b8f46bb679f010c53d884521023e79aa7680627104"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.5.0/sentry-cli-Linux-i686"
        sha256 "8d860d698c40e86a269204c77893a2fecb5467c5dc7b1de56e0877313aa245eb"
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
