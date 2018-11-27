class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://downloads.sentry-cdn.com/sentry-cli/1.37.0/sentry-cli-Darwin-x86_64"
  version "1.37.0"
  sha256 "80e5b34025fe378f8594131b8b5d73316674c1d9838b69e1a3642ddb25d9bb0b"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
