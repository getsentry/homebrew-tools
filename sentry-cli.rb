class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.18.0/sentry-cli-Darwin-x86_64"
  version "1.18.0"
  sha256 "8dd858a2c03a63f46381b2dc1a1d399cd8e97cc77917f72be133a12530c6070a"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
