class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.8.0/sentry-cli-Darwin-x86_64"
  version "1.8.0"
  sha256 "b6240d3cfc53f2b60ea96b3eb8b1e832ae18bf33afdaeef67859cbb233cc29a1"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
