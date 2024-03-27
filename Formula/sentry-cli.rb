class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.31.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.31.0/sentry-cli-Darwin-universal"
    sha256 "5d12bee428d18ca49657f2573b130a0c5990a665e0cbe6fad583e72a2fd1e3cc"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.31.0/sentry-cli-Linux-aarch64"
        sha256 "2b92198d58ffd2f4551db6782b42b42ecc1ba3c7c7864f0c4ae84be940f927d3"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.31.0/sentry-cli-Linux-armv7"
        sha256 "2745bc24c84fa7bf1b2c8331acc5bce8741a329ed3866162c5279296d856b1f6"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.31.0/sentry-cli-Linux-x86_64"
        sha256 "baeb5b4ca0a5e500d667087f0b7fbb2865d3b8f01896cfba5144433dbe59bebd"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.31.0/sentry-cli-Linux-i686"
        sha256 "7fd2ceef37baef7021aa3f8aa408f0f96d371b847f3d6f5704b7ce94e430efc7"
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
