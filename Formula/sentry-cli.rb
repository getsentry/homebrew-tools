class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.8.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.8.1/sentry-cli-Darwin-universal"
    sha256 "aded269c5e6448bdc18fefdd8bb2e3aafc14d7b62f786f224f1a005320d10fc6"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.8.1/sentry-cli-Linux-aarch64"
        sha256 "8607277dd4e672abec3d1f65a7b108e7f76c506467392141ce7b727f85e8a648"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.8.1/sentry-cli-Linux-armv7"
        sha256 "d472cfe971606d824ec03fb6950e3a7807a55933deaa91199c2b5e8dad59f495"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.8.1/sentry-cli-Linux-x86_64"
        sha256 "517e07749123f3b30c388a6e9347c6e7f99ed86808110e916c27d6a5638032ad"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.8.1/sentry-cli-Linux-i686"
        sha256 "e01b420d9371e29e3796faeb5cb5070de93e2d65deb94dd20d14f4bb90be2032"
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
