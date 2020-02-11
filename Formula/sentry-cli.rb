class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://downloads.sentry-cdn.com/sentry-cli/1.50.0/sentry-cli-Darwin-x86_64"
  version "1.50.0"
  sha256 "d32306bb7f467a7edc39caf7aa066ee93b7f20fadac4bda504d3b18e75eba347"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
