class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.29.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.29.0/sentry-cli-Darwin-universal"
    sha256 "f293dca4e495e191537bdf3713114015503f15fd5d03f0710bb184dca4be5a5e"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.29.0/sentry-cli-Linux-aarch64"
        sha256 "ea568ec8b566db7714efc6c7af522768a50a519cbe782a8e03e2f37b957e1164"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.29.0/sentry-cli-Linux-armv7"
        sha256 "9cd60d72dc036d079337996c5d483efaf23c8c70d0d5522791371e705c303d59"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.29.0/sentry-cli-Linux-x86_64"
        sha256 "5f0d3ea6a007c1e4dab85e35a84eb828410b52967eae64a6ff338ef901a6c219"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.29.0/sentry-cli-Linux-i686"
        sha256 "d0f4d0a157b3519f40726ef7695c63f80b60dac724b7544664fd23a5175f1242"
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
