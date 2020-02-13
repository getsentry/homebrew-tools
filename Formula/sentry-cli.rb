class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://downloads.sentry-cdn.com/sentry-cli/1.51.0/sentry-cli-Darwin-x86_64"
  version "1.51.0"
  sha256 "a949f4cd26bd7b42945c6980d02dad7e6733bbb45ad93c5b8afcf78701b1c58a"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
