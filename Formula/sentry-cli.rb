class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.34.0/sentry-cli-Darwin-x86_64"
  version "1.34.0"
  sha256 "6563294ae9cdd2d8258732295e6d2b3f5ff162e08cbc625f1774df7510bb7d8b"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
