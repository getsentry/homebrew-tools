class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.24.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.24.0/sentry-cli-Darwin-universal"
    sha256 "055cb6cedb1d00a0eaf016e102f47dc2d62359f959dacb47ca13d7f31a8cf331"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.24.0/sentry-cli-Linux-aarch64"
        sha256 "71ef47f50b1a89af96c3b24227bd52c65469a95cfeeacf8c3d8b987b9c3217e2"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.24.0/sentry-cli-Linux-armv7"
        sha256 "560d3dacc3f675b347efe33904bafecd0bcd021ff2f8f9de6527ab285d2c1431"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.24.0/sentry-cli-Linux-x86_64"
        sha256 "c1ee72ab611ddf5c1a78e4d9e1398cbcd7734118fb27b2c3790981298a80e203"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.24.0/sentry-cli-Linux-i686"
        sha256 "93e2f0c498d7dd17433a613fa98a2216000f1dd5491302399aff401874c84e05"
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
