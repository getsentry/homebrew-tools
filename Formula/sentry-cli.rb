class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.14.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.14.1/sentry-cli-Darwin-universal"
    sha256 "eece9ea16d69cb99c9e2a2e797207ae0c4e5db9aaf6a5beaad0c364c56ae4cc6"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.14.1/sentry-cli-Linux-aarch64"
        sha256 "f475f9c778d48d1676dc3785aa9fa81301fed95498297eb893d114f3ad49b008"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.14.1/sentry-cli-Linux-armv7"
        sha256 "f7ff875dec5cd2e34ff628321a53b79a9228c6f6145f7bc73cc4b2fff01ee05a"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.14.1/sentry-cli-Linux-x86_64"
        sha256 "473df54936d111d9864ca20c34a746174d7c9cb069e0387165d5ffa713f7f124"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.14.1/sentry-cli-Linux-i686"
        sha256 "4b3e5229236deacbb7d338d97c06f75412ed72995aa4af7f08d8ba2bc80c4304"
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
