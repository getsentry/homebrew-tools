class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.0.0/sentry-cli-Darwin-x86_64"
  version "1.0.0"
  sha256 "560bb5f3ae7681d34d51f4234af7c00baee46c6571a8597c2bb2d3e838794f72"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
