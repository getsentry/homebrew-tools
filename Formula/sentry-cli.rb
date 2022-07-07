class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.3.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.3.1/sentry-cli-Darwin-universal"
    sha256 "374ae7f2c8a24fca15c6a8533f5c7b50eeba1981988f0b3023da58e990c180c2"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.3.1/sentry-cli-Linux-aarch64"
        sha256 "686b703e0ac26d75414dcb6d9730fa7e6887895e5aaae6dcf14dc5aa9c141340"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.3.1/sentry-cli-Linux-armv7"
        sha256 "81d6ca2fbcf54acbebab15a818cca7861c6382b35189ed5a673be61dfddcf30c"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.3.1/sentry-cli-Linux-x86_64"
        sha256 "8bc5c67fea24c0be9fe9ed64b8b1e2ab14a98299cd11052f8e2dfea31f529ebb"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.3.1/sentry-cli-Linux-i686"
        sha256 "3f602e9ac5d6268a87f72b5abaf2d25e210fb5dda107d3bc5c40c2601a82ed05"
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
