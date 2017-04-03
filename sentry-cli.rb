class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.3.0/sentry-cli-Darwin-x86_64"
  version "1.3.0"
  sha256 "d60e07748eec1958767c4cd5cbf9746e0e24bd2c571e063b38fabfa9411da85f"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
