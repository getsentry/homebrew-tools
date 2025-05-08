class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.45.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.45.0/sentry-cli-Darwin-universal"
    sha256 "bec01e4afabfb88c30c9b86d92e1c4857c2dd3b6e6870e37380f1cc680a3dede"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.45.0/sentry-cli-Linux-aarch64"
        sha256 "bcb31138b5b9581d1f61fbbcd31f4b7587407833651e31d265e54c227a25898e"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.45.0/sentry-cli-Linux-armv7"
        sha256 "965ee3b781f60da223af1f1dfd6d985b0ba97c6e38f48ec05105e5e7276d2def"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.45.0/sentry-cli-Linux-x86_64"
        sha256 "ed3db82f44ecdfb8fc17b163ce5580f3af67d335df63e9dd73c0c457a2346a3d"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.45.0/sentry-cli-Linux-i686"
        sha256 "bf95215958a49e9da32d3d8123a1edd49f35fe00a40098eb6b3a7458a8735a98"
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
