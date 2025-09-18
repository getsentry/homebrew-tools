class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.54.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.54.0/sentry-cli-Darwin-universal"
    sha256 "1f4e0c0ae1ff6cdde7f7d5958b4efabc0908fab5594900c49d5b55d48e455fb9"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.54.0/sentry-cli-Linux-aarch64"
        sha256 "8c59d5d93a5cb6cc09873a7548e011d6e594f42f88d50e4ad5542c1494586047"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.54.0/sentry-cli-Linux-armv7"
        sha256 "ba062d3bd4e3ab56e8c9dcb7d85c4b1a17392356e0a393c41195411e30e0070d"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.54.0/sentry-cli-Linux-x86_64"
        sha256 "3bd243899a31908154e19f65219fd13984166c45ce95393aa4d90c4f37c14194"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.54.0/sentry-cli-Linux-i686"
        sha256 "600e78cd10dd2a8e3a0deb0ba5ccd14b2be2984c4bae831219b4b430b89d4c02"
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
