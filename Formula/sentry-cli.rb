class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.52.1"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.52.1/sentry-cli-Darwin-x86_64"
    sha256 "7b80543171870d5970cec15984173503c70012c02fc90c3cc17fa4f58e3a2103"
  elsif Hardware::CPU.is_64_bit?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.52.1/sentry-cli-Linux-x86_64"
    sha256 "e3ed0608c4a8329e2e2037b4e25436be9ad1552a35035e4fe98e7207e5d2650c"
  else
    url "https://downloads.sentry-cdn.com/sentry-cli/1.52.1/sentry-cli-Linux-i686"
    sha256 "260b7cb4f9d1c26cfea541359593ef46bab06f07a3cad30202f126fda3e878e5"
  end

  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
