class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://downloads.sentry-cdn.com/sentry-cli/1.42.0/sentry-cli-Darwin-x86_64"
  version "1.42.0"
  sha256 "31ca7a42fc9a5d6bac49432107a88a7e38a9cabf8eca98b908d1725b5782b444"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
