class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.29.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.29.1/sentry-cli-Darwin-universal"
    sha256 "c6bd1f86edfe6889e8f35388065afa6caa567a52c7ad881b18be372c4cdfcca2"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.29.1/sentry-cli-Linux-aarch64"
        sha256 "7a2ce27a6d27fdc1c3fe6e02ff4716eb3f1e0a774f012b017bd3c761b25a245d"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.29.1/sentry-cli-Linux-armv7"
        sha256 "78bc5233d6cac2a7743b2caface066a258050fef7fcf9f5f7bebe0baaa61b172"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.29.1/sentry-cli-Linux-x86_64"
        sha256 "e2c14f5723cb4e4bd64458147ff349f754a4eb4d228a6176992bda9b39d4510f"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.29.1/sentry-cli-Linux-i686"
        sha256 "916c25adbd7e959228842a3fecb292a0ab323e224249deaf44ab00f2ff2da377"
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
