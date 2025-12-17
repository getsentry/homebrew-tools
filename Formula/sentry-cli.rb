class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.0.1"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.0.1/sentry-cli-Darwin-universal"
    sha256 "720af732451032b5be7df75baacc313ea21ee645f9ad4872d0a39524db274981"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.0.1/sentry-cli-Linux-aarch64"
        sha256 "5eaa180ae11e63af80cab6303a8d223dddb7dcea7c0a7c933b26fa91b54c9cf6"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.0.1/sentry-cli-Linux-armv7"
        sha256 "3dc9cb18e302db1bd1c7c6edb2cdbe0fe250ab4b815787f551a07553b692e42b"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.0.1/sentry-cli-Linux-x86_64"
        sha256 "7cf53a2089fd5a6a9a0c2eb972d62c9c8eefea19dcdd5dd58604aa8bc4212538"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.0.1/sentry-cli-Linux-i686"
        sha256 "c6214a8f34b39e572d5e9dbebe118d26e4707ceced807439bfb845b6b8373c29"
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
