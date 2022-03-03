class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.73.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.73.1/sentry-cli-Darwin-universal"
    sha256 "041e3994de2d49c562792ae74d2a4f9be1fa145f267dcb1ec894cd83cb8ec2f6"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.73.1/sentry-cli-Linux-aarch64"
        sha256 "3dc9dacf69d55f4fe64e67dccbea647f50f884019e0d0eb58534f407bbde7fbd"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.73.1/sentry-cli-Linux-armv7"
        sha256 "28bbd534ab4312e6a49b9792cf6f12c77fe5a280fa7bb7d71101af66ce3380b5"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.73.1/sentry-cli-Linux-x86_64"
        sha256 "85ca7fce2267088766fdb6d00d6ff3ad45e43c234eab21a107e70292cee714c7"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.73.1/sentry-cli-Linux-i686"
        sha256 "437eeed2799dabae95e3fda76ddff649604729068265b2c2d88afff1a3a64446"
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
