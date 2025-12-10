class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.58.3"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.58.3/sentry-cli-Darwin-universal"
    sha256 "a53c85d540bfe160922d187a45274f0514df087c2a24c6af2bdf57d736405a0e"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.3/sentry-cli-Linux-aarch64"
        sha256 "30f95cf10ff96bdbbfdc1a25a7b65ee0a7f906f2c380c0cdde185d14d5535246"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.3/sentry-cli-Linux-armv7"
        sha256 "ae2c0ecee950055b388817bdb6dd543730c36d6def8794252c00314c3f0a7e18"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.3/sentry-cli-Linux-x86_64"
        sha256 "645e64af49e68a285b66d7ddf440d06b76f8a5603797060f61c0c487ac7e2a89"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.3/sentry-cli-Linux-i686"
        sha256 "4a36158a3140a26e1e8fbbb72f80a836df3f49ebcb5787e05b360e0f9ee01b3c"
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
