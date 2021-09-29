class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.69.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.69.0/sentry-cli-Darwin-universal"
    sha256 "ee1f32452acf6d461d02c7612ca261da35808c943882633e98e3fdb71d8a0b00"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.69.0/sentry-cli-Linux-aarch64"
        sha256 "4320d3140e682775af5de6ade7fbf4f21b1cda614bb2bde747117905e8cd00f2"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.69.0/sentry-cli-Linux-armv7"
        sha256 "dbd8cb73dfaf91a9a7f57b769cae9a459f95c182f3ace62fae3a8e41d7018dac"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.69.0/sentry-cli-Linux-x86_64"
        sha256 "cc7aae7aea4d2d5cfa01632a5b402509f254c8d24c530ffd3119185b16e65afc"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.69.0/sentry-cli-Linux-i686"
        sha256 "3cddb71350b9a9749b013d4e86fb528f8699698db042dd3300b5ff39a32213de"
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
