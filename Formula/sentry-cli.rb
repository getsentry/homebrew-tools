class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.0.3"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.0.3/sentry-cli-Darwin-universal"
    sha256 "89a6c663d8642625281ce0313d07f7e14762cb94d05e3b3159b28ad1dfbf7be5"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.3/sentry-cli-Linux-aarch64"
        sha256 "ae1d495faa0f92a681e9425a61a6364e28105181911428f9db6dedd94a81ed8f"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.3/sentry-cli-Linux-armv7"
        sha256 "88242c3bd2cd47bab201c5209aad3baa0c8cf4b73cef28e4da27f6e1a8ff08e5"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.3/sentry-cli-Linux-x86_64"
        sha256 "fdcc34085404086eff7dd0d96bc68603da4bce1c094f8898fccfd08b4e599453"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.3/sentry-cli-Linux-i686"
        sha256 "ce876ee505911815f34a01d94ffddcd4575c5f3cf7d893081374ef237847d9f4"
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
