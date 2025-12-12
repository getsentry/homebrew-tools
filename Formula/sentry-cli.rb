class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.58.4"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.58.4/sentry-cli-Darwin-universal"
    sha256 "5a1c1121b45c48504d2ae58af11c743c5663ea8979db3258961838a16cf90c08"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.4/sentry-cli-Linux-aarch64"
        sha256 "672cb986b0c5d84ef724f39b3aa189be802bceb8bc7dc8c5776a0ca90fcf41bd"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.4/sentry-cli-Linux-armv7"
        sha256 "e8df469ae35f6d8cd788fe2967c5420633bb09348ad09953d5176615cf1bead0"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.4/sentry-cli-Linux-x86_64"
        sha256 "a4932b4315b192b3d037678a16eb2a5a8731609f671fc4008e643b85c3c74cb6"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.4/sentry-cli-Linux-i686"
        sha256 "1b05efec7bc2ebf4dca8f3e6ededa8ffedf8ee2dd49e23d434a20885bc9a50cf"
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
