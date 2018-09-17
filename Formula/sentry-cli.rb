class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.35.6/sentry-cli-Darwin-x86_64"
  version "1.35.6"
  sha256 "5bf941e0be4b0134bb9dace0fc12d60ca4021296bf8fb67482d52838d56d1941"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
