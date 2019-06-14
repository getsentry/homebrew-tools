class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://downloads.sentry-cdn.com/sentry-cli/1.44.4/sentry-cli-Darwin-x86_64"
  version "1.44.4"
  sha256 "8b0a0e9b01c03d6e17f6b2a16d1b3c383084bb4dc0583407557423bf56428233"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
