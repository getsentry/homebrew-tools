class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.55.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.55.0/sentry-cli-Darwin-universal"
    sha256 "abfeca7cbb1f8b50b188118ab952728d973aebcfe8caa47e16853319b3e1d925"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.55.0/sentry-cli-Linux-aarch64"
        sha256 "ad6f0669617b82ff78ebe90dac53ea92231d4dda3447f4db9b066424ff3de665"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.55.0/sentry-cli-Linux-armv7"
        sha256 "abbb55ba695184d272118b8d19d3bbe09843b5fd898efcf88481b5a92a548352"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.55.0/sentry-cli-Linux-x86_64"
        sha256 "28bacd307c8a7b19d54a38e1a8d9808efff7e7382941c68ea6305d1c3385caef"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.55.0/sentry-cli-Linux-i686"
        sha256 "4017c2d8d756b38f60179d4f481c278265b9be5ca7ae109ee87685b4a16c0cf0"
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
