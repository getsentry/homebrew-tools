class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.31.2/sentry-cli-Darwin-x86_64"
  version "1.31.2"
  sha256 "6b9513ac2d93daf4af7ef1927235e29d2c8cf72fd1bee334ea0223a197b9d60c"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
