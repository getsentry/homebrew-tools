class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.26.0/sentry-cli-Darwin-x86_64"
  version "1.26.0"
  sha256 "508eee3a01879552d0e9dbfc117da71998b4b87996c74e44ea7cc02b8b6be5e0"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
