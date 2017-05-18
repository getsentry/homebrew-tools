class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.10.0/sentry-cli-Darwin-x86_64"
  version "1.10.0"
  sha256 "eab91bc7f634b2bb4bb3eddd1ea0190cd5183c6aeaf43046f6c83ac83fab3500"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
