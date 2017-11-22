class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.24.0/sentry-cli-Darwin-x86_64"
  version "1.24.0"
  sha256 "973ca596524f3e8a71cdc5cbdf67e5ab24dc79b226dbec32b80bca5773a2f6b8"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
