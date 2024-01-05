class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.24.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.24.1/sentry-cli-Darwin-universal"
    sha256 "b42b8cdd9d83541511da0006ad343bc15e44d2726e9946376d1b7c770f92d8e2"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.24.1/sentry-cli-Linux-aarch64"
        sha256 "4875d5e626b18df9ccae3689c8c92932c47a8c366e22faa6274729e91697215a"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.24.1/sentry-cli-Linux-armv7"
        sha256 "cf4b00187fc400eeadff54168aeb53880cf1ac2abc742dc287bb424d764ecbc0"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.24.1/sentry-cli-Linux-x86_64"
        sha256 "0390cdb43561b65a21795fa933f6882a00c6eccfededfd7178675481ab26c15e"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.24.1/sentry-cli-Linux-i686"
        sha256 "1a0ba5fa3a1530a14f0942c4a10b256c37698b4acd2667186eb35c53ab0e62fc"
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
