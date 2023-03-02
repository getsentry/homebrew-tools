class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.14.3"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.14.3/sentry-cli-Darwin-universal"
    sha256 "a4414f01ec058f42992429dc466e1ea863ed2e9779ef9756c5769d167f27946c"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.14.3/sentry-cli-Linux-aarch64"
        sha256 "7c3982b6b1b1b9b256e73f0d648b41456494e8ea0fe82a5b2d939dfaf5bbb741"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.14.3/sentry-cli-Linux-armv7"
        sha256 "2b957fac4c8776ae7ec0c8a08f1b273b778472098daf7c750502a8d7f4719e7e"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.14.3/sentry-cli-Linux-x86_64"
        sha256 "0de8f58be0687d8c0cc78591c3ba33ced93b5976eac1ddb713c1074f1d3403e0"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.14.3/sentry-cli-Linux-i686"
        sha256 "e13aa44c84860ab3e47fc3a52aa576685f25c792d3d74ee32c42a0bb3b873266"
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
