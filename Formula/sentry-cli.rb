class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.38.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.38.0/sentry-cli-Darwin-universal"
    sha256 "7ebe813fa13d84fde825d27f2914ee7b0de9b9f3e18c688cce282d3cf11445c7"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.38.0/sentry-cli-Linux-aarch64"
        sha256 "250b194c5a79fc620079575ca4421381473683f5116393b0f6436032e39b943e"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.38.0/sentry-cli-Linux-armv7"
        sha256 "7e0624f5e5772da47ca74f473acf82785f6104d6e3db5c5685dbd4b1105e436e"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.38.0/sentry-cli-Linux-x86_64"
        sha256 "93348eeffec53bbcc0ca7175c342edf507bda76805938e9ecd73825e01f6533d"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.38.0/sentry-cli-Linux-i686"
        sha256 "26bae7c27a0ab72691f30cd05ad5496585ff6622f2d3561adb5a3bfbbcc80cee"
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
