class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.71.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.71.0/sentry-cli-Darwin-universal"
    sha256 "1d08b3bb7daa120dd42cc2a75986da67983e04617149e657544c600355b436fa"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.71.0/sentry-cli-Linux-aarch64"
        sha256 "1631d68805f792c4a3b24a96d90e503de3548e20db3913b0f455ca418c07d850"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.71.0/sentry-cli-Linux-armv7"
        sha256 "cba7b985df1e2670a2c488777371709c8f1b6d87372181f295257d31b5d6ada0"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.71.0/sentry-cli-Linux-x86_64"
        sha256 "3e184a4348e5ad96542450b0703146e8b6802f49aba1d999557e0c534e647605"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.71.0/sentry-cli-Linux-i686"
        sha256 "d192abcbe7ccedabe602c52af198af5cd11e0290a48575f3e86d6e89d26ef3cd"
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
