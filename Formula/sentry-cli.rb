class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.47.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.47.0/sentry-cli-Darwin-universal"
    sha256 "0cee2628fc3835e7238b6a249a59de11391dd2b6bce21eee35254e23947e7aba"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.47.0/sentry-cli-Linux-aarch64"
        sha256 "6e06fc74b6449a3cdf3cbffaf4347ae2dd768efff04fa43a306d9ccea4ede54c"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.47.0/sentry-cli-Linux-armv7"
        sha256 "e1d751963403568bd2cd1de3064bf72522ab782d0e6b67153655bf9ca6459ff9"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.47.0/sentry-cli-Linux-x86_64"
        sha256 "d51a6bc0fa076dcd3d4121b9c3f21999057a1727cbc4113f07e0acf8f17afe48"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.47.0/sentry-cli-Linux-i686"
        sha256 "fe55d031baf9d182338a0f40a443018cde535371a01a02c0eef60487ec03010a"
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
