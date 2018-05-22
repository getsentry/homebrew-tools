class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.32.0/sentry-cli-Darwin-x86_64"
  version "1.32.0"
  sha256 "f8ba9dcb2f4dac0d399e8d040d4ab0ce427030eec26d017270935f3328890fa0"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
