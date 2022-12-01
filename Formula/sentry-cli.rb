class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.10.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.10.0/sentry-cli-Darwin-universal"
    sha256 "cf5192d782450e9fd2c5317d787371688f6c5773e3c4ee64630a6df2edc02aa7"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.10.0/sentry-cli-Linux-aarch64"
        sha256 "03d7e8184eb471dde5657c7ec4354b85f682f611d1826224edd4894425bcbf0c"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.10.0/sentry-cli-Linux-armv7"
        sha256 "0436822ba31bb83c176e26a7ab59d569f217ece8c7ba17a280090773d6fbbe34"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.10.0/sentry-cli-Linux-x86_64"
        sha256 "7ea086bc2baff8452e490eacb24e20becb2d890050648e33d48db656cadbbf2e"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.10.0/sentry-cli-Linux-i686"
        sha256 "bf32dbfa44fb2e1db054b9bc27ba4ff950d46c32911a4c114a8a58da6bdc3862"
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
