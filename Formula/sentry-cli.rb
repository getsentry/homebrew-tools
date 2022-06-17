class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.2.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.2.0/sentry-cli-Darwin-universal"
    sha256 "96f380d262725e88fc2ae83a1449eadc1fb6ffcaad61feee68de468d599cd96f"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.2.0/sentry-cli-Linux-aarch64"
        sha256 "889aeaa277cada5287ed87821db4145d1f38dc367e85a1405282a68bb736a1a7"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.2.0/sentry-cli-Linux-armv7"
        sha256 "b4ceec0c1dad0e686a47cab92f82533c880b59840aebd9b0173ad16ae33237aa"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.2.0/sentry-cli-Linux-x86_64"
        sha256 "03144d349c30aaf1d89b661eb6e8b7d09144938e38d0c9191eb2a571535c95f4"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.2.0/sentry-cli-Linux-i686"
        sha256 "6ee5ce20cc2bce0408e5b2e2cb4b1d7ade453b7d8f532ec7a26660e3ef7b86fc"
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
