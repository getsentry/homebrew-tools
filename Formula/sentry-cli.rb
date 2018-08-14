class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.35.0/sentry-cli-Darwin-x86_64"
  version "1.35.0"
  sha256 "6fdc3519e8877582861ba0f36af005f9005d9cd1dcd79ee236687bb9c9211ceb"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
