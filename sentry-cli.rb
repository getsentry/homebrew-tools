class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/0.28.0/sentry-cli-Darwin-x86_64"
  version "0.28.0"
  sha256 "5718bb0e105715cc4e72c5eff7e5f545cf11b15e4f63a25fc6562c71b99dd3d2"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
