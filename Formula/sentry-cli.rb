class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.36.0/sentry-cli-Darwin-x86_64"
  version "1.36.0"
  sha256 "7df6c06ac39e95fcef495c2f3cf690868fe79ffb664e3e8541ab6ad39202f6cd"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
