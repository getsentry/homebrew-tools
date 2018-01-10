class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.28.0/sentry-cli-Darwin-x86_64"
  version "1.28.0"
  sha256 "3010fdacd32adea832f6c0f65ee7363f90612d29469b9d277e5f5959cf5faf5e"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
