class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.32.2/sentry-cli-Darwin-x86_64"
  version "1.32.2"
  sha256 "8dc1cb5337af4a2a70b03cdd6243b50548f1fdb74f6eed220fd4f3679f688d98"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
