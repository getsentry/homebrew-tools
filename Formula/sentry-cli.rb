class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://downloads.sentry-cdn.com/sentry-cli/1.51.1/sentry-cli-Darwin-x86_64"
  version "1.51.1"
  sha256 "2fe8bcb052706153ff9e85e0af804ac1a35178c00d1efa9a5d66e418be8724df"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
