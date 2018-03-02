class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.30.2/sentry-cli-Darwin-x86_64"
  version "1.30.2"
  sha256 "84c31abc9e814c6b30e11afc22ece4514418dc9cf4bc8d3897f03fe9af901e5b"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
