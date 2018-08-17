class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.35.1/sentry-cli-Darwin-x86_64"
  version "1.35.1"
  sha256 "72e02e073b7de5a96dd021d8e03a580307337973d5ee2da1bba4e1ef8e3bb4d6"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
