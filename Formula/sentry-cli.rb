class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.11.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.11.0/sentry-cli-Darwin-universal"
    sha256 "ba015e44504b7c2b35276da5b2c728c35ee5acdf29fe45e760700128004ef2f5"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.11.0/sentry-cli-Linux-aarch64"
        sha256 "c62c5c1259307611e78af4f24a4c30162cff8adb0f021d363b307c42cded5c70"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.11.0/sentry-cli-Linux-armv7"
        sha256 "f0bec55d1819a9d97b3f6cc494cfca471157ecfc7efbff2bbc4713607800d2eb"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.11.0/sentry-cli-Linux-x86_64"
        sha256 "bc8f5f223fa688b3ad963c60a729f02aa8f5b17525de66fb3abf86800977ff6e"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.11.0/sentry-cli-Linux-i686"
        sha256 "25c5e7e6d978d1e66bc26c9e4282633135a318ed0ac36cb73b4fa58f59fcb089"
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
