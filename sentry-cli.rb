class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.11.0/sentry-cli-Darwin-x86_64"
  version "1.11.0"
  sha256 "297e554b0a27e038ec4a36be655dda56082c0d25573f1f3c3db5298a6d2ac37f"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
