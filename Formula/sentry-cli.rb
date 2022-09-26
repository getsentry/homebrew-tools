class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.6.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.6.0/sentry-cli-Darwin-universal"
    sha256 "622822734d5933c1eb08b26ba284573587924821fa9848c3c5e8ec6cb97a93f0"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.6.0/sentry-cli-Linux-aarch64"
        sha256 "8cdbc148ff8a7620a45fa97dd2e25a4d56fe353583dd78c17aac3cc0978f09dc"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.6.0/sentry-cli-Linux-armv7"
        sha256 "fdcc026b011276f3e157cc87808130c2101945632e3561d39987718ff28b0c60"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.6.0/sentry-cli-Linux-x86_64"
        sha256 "e1ab2d6bf031e3ec632b3d336641615a65b0ffe81208e420a7f8010c2082574c"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.6.0/sentry-cli-Linux-i686"
        sha256 "ff78cbc34e8ede5c9efe2a586f2cb903f87be327d0e660446d730e83ceaf012e"
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
