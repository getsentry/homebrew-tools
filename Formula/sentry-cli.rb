class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://downloads.sentry-cdn.com/sentry-cli/1.39.0/sentry-cli-Darwin-x86_64"
  version "1.39.0"
  sha256 "5315c34a9aad102b3c66f35acdca6616b5fcaa928c7171b615dbf013260756af"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
