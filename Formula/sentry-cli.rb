class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.23.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.23.2/sentry-cli-Darwin-universal"
    sha256 "b8a1f6a855400e483a51e3c9efb2fc5c256879d88ded8cd2e2f97c5a3a0ee086"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.23.2/sentry-cli-Linux-aarch64"
        sha256 "0caaa6ef000667a584ee4308a2c151ee9fb586d7d2ceef1f64837043e3b8bf79"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.23.2/sentry-cli-Linux-armv7"
        sha256 "83d95451a7c2e788a806531bd9d0ccf7e6e6292f9e74cd771021bf03abc584da"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.23.2/sentry-cli-Linux-x86_64"
        sha256 "ce0b62603da9fdc3d37aeb1f2af1b04c82efaf32a8d36114c950d7dc32ed11a8"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.23.2/sentry-cli-Linux-i686"
        sha256 "d92e9d461db1bf0995abd48251490969ab955dc8a3bc525cf72d717a56fffac6"
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
