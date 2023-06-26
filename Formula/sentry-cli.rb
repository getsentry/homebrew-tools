class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.19.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.19.2/sentry-cli-Darwin-universal"
    sha256 "f43fa6f1d4acac2117a5db501ffea319d5d993581584802e69f00b289234246b"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.19.2/sentry-cli-Linux-aarch64"
        sha256 "e8f2153c23bc5b4a44e36981d6b19102e7db78f1472a1d99ea2bdc33a4ee8d7a"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.19.2/sentry-cli-Linux-armv7"
        sha256 "d0018acdcb49b804214ede61ced93b9b9fdfed7de0ee2382cb71d3e688c186dc"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.19.2/sentry-cli-Linux-x86_64"
        sha256 "12ffbaaa930ea3e5883fd1065b2ecf6167f90f5e4d8ea38925f56ae3eeccc4e7"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.19.2/sentry-cli-Linux-i686"
        sha256 "3fe02091eb319242e24f55097404b3b9e767918ab16b4431ad7b3e1ff4b3d14b"
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
