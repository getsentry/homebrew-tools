class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.15.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.15.0/sentry-cli-Darwin-universal"
    sha256 "77423efd10c925c06333cc7bf34f86f58e4fd330a58e66ecc74e3cc750624eb6"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.15.0/sentry-cli-Linux-aarch64"
        sha256 "f2ae62987e7e99746b8ccf1805df7306dfbea491c1c5b541792497a9d4970fb3"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.15.0/sentry-cli-Linux-armv7"
        sha256 "8542cd31aa9fec1a670f50f73204c95a70e86cc4f95c93b29a1f9bba3a515fea"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.15.0/sentry-cli-Linux-x86_64"
        sha256 "d8e018b9ee778c89844e6bfd313d22f6ac7dc8eb5454ff696203b61aa5aed18d"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.15.0/sentry-cli-Linux-i686"
        sha256 "21fc7209f5d94d3468226cd76144681a4e787020098e9dfd329df0ce84911594"
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
