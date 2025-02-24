class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.42.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.42.2/sentry-cli-Darwin-universal"
    sha256 "957bb8224e5d1304e97793ad674e5c42426fe0023dcdd937cfc2a5f8ce2e0b6a"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.2/sentry-cli-Linux-aarch64"
        sha256 "5b0eae7991817bb58ec9a039fdec38cace47c40f5133e11f553985968dc74af6"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.2/sentry-cli-Linux-armv7"
        sha256 "1d06e01e7e8bc42def337469626bdcc9693eba4950f225a24b6d4204c7e0a060"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.2/sentry-cli-Linux-x86_64"
        sha256 "7d5e69080cac84468547796a1123a2db05133dc4da5b4b042f5f1b5f32050cc5"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.2/sentry-cli-Linux-i686"
        sha256 "345926403c9e3c58d39b4938eee43299966e6984fc1ba3030ad21932d498b8bf"
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
