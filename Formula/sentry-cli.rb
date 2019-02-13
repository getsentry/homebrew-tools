class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://downloads.sentry-cdn.com/sentry-cli/1.39.1/sentry-cli-Darwin-x86_64"
  version "1.39.1"
  sha256 "2bef36d87f7851684e6274706d74698b4d3bc659ccb79697a7bcebb698f0b0ab"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
