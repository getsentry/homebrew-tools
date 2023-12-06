class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.23.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.23.0/sentry-cli-Darwin-universal"
    sha256 "042bf36aebe9081264a6d95a098712b4006b66df356ee4440851a3c26acbbbf4"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.23.0/sentry-cli-Linux-aarch64"
        sha256 "66d0b504d983ff2f7b5f60ebf5b3c933ba8a93c2a608f759863fd2b446b344fd"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.23.0/sentry-cli-Linux-armv7"
        sha256 "940b8844f60cc04c8aec65c38aedc20c2fde949f97576f7ae34f9febfb561d80"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.23.0/sentry-cli-Linux-x86_64"
        sha256 "23d3fdb2e797a1f49917b13cd040874f6189aff3f24d56d3fb81d74c1f368372"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.23.0/sentry-cli-Linux-i686"
        sha256 "180306e08e5ec10445aa2f0ce1abb07740dceb30685dc53cd8b26a35909db20f"
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
