class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.22.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.22.2/sentry-cli-Darwin-universal"
    sha256 "a07140b9c0230701b32e2039084c15dad4dc3b0adf7bad9786d4d0c7e6e5f2b6"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.22.2/sentry-cli-Linux-aarch64"
        sha256 "2735553ddd4de44fc454980636284b3e5a25de17bafcef640d1d898d3952180c"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.22.2/sentry-cli-Linux-armv7"
        sha256 "d25a58b53616381874ed6cf6a0d4317d7131073127d373358e7a2a5d4c5056f6"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.22.2/sentry-cli-Linux-x86_64"
        sha256 "4a7dc4070df29fc8b540f1be579a9d4b01ed7d4e8993a8d2486149d7fbe3b951"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.22.2/sentry-cli-Linux-i686"
        sha256 "9aa8680694b87c4853ff14d62c16155c2a553d155ab83fe509957c77e53cd266"
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
