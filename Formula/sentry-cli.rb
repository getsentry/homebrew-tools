class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://downloads.sentry-cdn.com/sentry-cli/1.41.0/sentry-cli-Darwin-x86_64"
  version "1.41.0"
  sha256 "a03ff1b7e601614ae7f726943dfbedbbb83eb01391b33121474ce5959a16d2d2"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
