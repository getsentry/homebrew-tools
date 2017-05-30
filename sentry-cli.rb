class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.12.0/sentry-cli-Darwin-x86_64"
  version "1.12.0"
  sha256 "41e2bfd2f6183448a809e9f07ec734c95d03ee5425e1ce0b0e2891434ef45d91"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
