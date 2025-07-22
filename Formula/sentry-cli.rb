class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.50.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.50.2/sentry-cli-Darwin-universal"
    sha256 "70ef2a02e303d6bdc12897105189f582b6b8f8b25c0fc00cad3f628022ceb8e4"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.50.2/sentry-cli-Linux-aarch64"
        sha256 "872afe27ff00c71f1c346931d625e8fa2897bd1543d31be16075cc97f5ea99ab"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.50.2/sentry-cli-Linux-armv7"
        sha256 "9b6aba1b7ce655da6efdf19b037dcd9e46ce55042e9e41a8958c30a9a2a164f4"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.50.2/sentry-cli-Linux-x86_64"
        sha256 "d003d220e2fe07c84297f9586682fc2fbd848357833ae13de5e214ff42a62f16"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.50.2/sentry-cli-Linux-i686"
        sha256 "d272ba5b1655ef0c851d9a74b574bcc3de1554ae26a94649045a215821c55bed"
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
