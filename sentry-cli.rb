class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.4.1/sentry-cli-Darwin-x86_64"
  version "1.4.1"
  sha256 "b2d63d39b0eb506a4506fd0f1790b6e2a46a2c6cf0978bd0e27cfe298361b817"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
