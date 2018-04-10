class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.30.4/sentry-cli-Darwin-x86_64"
  version "1.30.4"
  sha256 "e4461c664568cb8da93ffb2a614a2e9ce0c4c0a4a5d6283f1b5e89c0eadb411d"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
