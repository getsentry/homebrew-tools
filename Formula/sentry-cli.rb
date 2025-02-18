class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.42.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.42.0/sentry-cli-Darwin-universal"
    sha256 "a231376c6e73832eebc5512eb0de4b39472caa17e0ce2140035da23b83837021"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.0/sentry-cli-Linux-aarch64"
        sha256 "88af2f5604f0712bfb6789076896e4b2ad26f09d9cef68f62dc52c96271367d3"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.0/sentry-cli-Linux-armv7"
        sha256 "212a569b03412a9b18acdd70ffdf4f224fc013c2e0362baac8a04303870b2be1"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.0/sentry-cli-Linux-x86_64"
        sha256 "07afb2354053132461679ae26e0ba9ce894558a3217d4a6c19bd1f8c6c828525"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.0/sentry-cli-Linux-i686"
        sha256 "8392a0febdb821e8ae64f09cb6b2caaaad7316ccc5027387ae0677d15a6cc71a"
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
