class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://downloads.sentry-cdn.com/sentry-cli/1.49.0/sentry-cli-Darwin-x86_64"
  version "1.49.0"
  sha256 "4e17bbef7d00251b2a1eda66073f887ce34479c0fa1216584b9c5e3bc7790d55"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
