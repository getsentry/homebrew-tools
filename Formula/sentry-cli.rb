class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.60.0"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.60.0/sentry-cli-Darwin-x86_64"
    sha256 "7a195fd531dc463ee6b9aeb93e9bcf66154c7ab0a78dc900a40a8f2237e0f7f5"
  elsif Hardware::CPU.is_64_bit?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.60.0/sentry-cli-Linux-x86_64"
    sha256 "e21320e84ddf28b5bffa04fe9a33b1b5c6a78c58e010d109ce5b2ca9c65eeae0"
  else
    url "https://downloads.sentry-cdn.com/sentry-cli/1.60.0/sentry-cli-Linux-i686"
    sha256 "d0ad06eec20c624796fd1073f3f3788c8bc47a4e66ff80415cbf0066c2962485"
  end

  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
