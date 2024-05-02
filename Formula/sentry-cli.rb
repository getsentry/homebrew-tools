class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.31.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.31.2/sentry-cli-Darwin-universal"
    sha256 "a8aac1d1821fcd42c75f9e8a4d9abd443d32dafa213f1c515d744de343d1f474"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.31.2/sentry-cli-Linux-aarch64"
        sha256 "17f2af78965d67571eb22b49934c4c7f2620a7b8e52c9db4116e73eb9877af88"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.31.2/sentry-cli-Linux-armv7"
        sha256 "1a0bb1d6a8b79a07ac2c839d26d696d59c19b80b236ed85cc5ee118e8047e5b0"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.31.2/sentry-cli-Linux-x86_64"
        sha256 "a6e82e7c4eac8d4c358bf261badf97f0d2fc7469093082397345cfe99f6caf18"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.31.2/sentry-cli-Linux-i686"
        sha256 "2d5ebac8cf8abfdc08b59cb69ba1c444787a9ddf201a819d201844d73cb386c6"
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
