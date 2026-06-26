class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.6.0"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.6.0/sentry-cli-Darwin-universal"
    sha256 "6aa4a42c8cf8591fe5e24cb62370dcfa40d84973bbb0f4725138eb47bb986e32"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.6.0/sentry-cli-Linux-aarch64"
        sha256 "987ab96a45610f00659a0ee633e64343495312e8c39250242dab12aa296240a2"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.6.0/sentry-cli-Linux-armv7"
        sha256 "98c6008651dda9ce2a8cec7fe635a3f00a563f49faf36b62afccc6af106befb0"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.6.0/sentry-cli-Linux-x86_64"
        sha256 "e2bff5d8b546f3fb72c616da656ecb347c7c144f36a5294b0749dcc2001f68d5"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.6.0/sentry-cli-Linux-i686"
        sha256 "7d0095ccd85d9ec9f3a4242dc86b317fe626da4aeac524eccd55856ec127e0d0"
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
