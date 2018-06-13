class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.32.3/sentry-cli-Darwin-x86_64"
  version "1.32.3"
  sha256 "7fba3c98bbc1cdff82eb4ea588c8fca30a1efa3ca9a7ceada03b48b2b7fa7722"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
