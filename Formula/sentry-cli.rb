class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://downloads.sentry-cdn.com/sentry-cli/1.47.0/sentry-cli-Darwin-x86_64"
  version "1.47.0"
  sha256 "72188bf61f35c7915f6d60b9612848b1251672a44b9aa68ae0fab912d5aa7b20"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
