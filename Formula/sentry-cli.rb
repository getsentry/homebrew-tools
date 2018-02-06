class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.29.1/sentry-cli-Darwin-x86_64"
  version "1.29.1"
  sha256 "6ba53f3e8d3ce52fdcc5c5ad4f407e9d5cab0dda3875bf903e83ea2dfe73bc2e"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
