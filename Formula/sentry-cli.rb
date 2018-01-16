class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.28.1/sentry-cli-Darwin-x86_64"
  version "1.28.1"
  sha256 "88cb1ee4c61a86a6d9b798fe8efb9085d160f2eb7d240581a40071fbcaf50f1c"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
