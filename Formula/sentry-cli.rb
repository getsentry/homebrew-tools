class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.58.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.58.0/sentry-cli-Darwin-universal"
    sha256 "b23b628f2d000898cbc8b323339218134e0856b0dfa2491c0328c09a27b02e69"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.0/sentry-cli-Linux-aarch64"
        sha256 "4ee4e5341ae3366a5e629ab7bebe3465f1443e7acc5daa6e808ce2ded0a412ba"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.0/sentry-cli-Linux-armv7"
        sha256 "be88fa9943072618f1c3ca785f447a2c1c6dbd800897ad64405bf91bd1af254c"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.0/sentry-cli-Linux-x86_64"
        sha256 "735b266c50b44735167292fef65c5889737f3a4d9f8150937e6d454217ca741d"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.0/sentry-cli-Linux-i686"
        sha256 "cee64604f94c401d3e215dfcb3f5c6292a6ff3df90c3c98d155cbb1da7ed0bc1"
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
