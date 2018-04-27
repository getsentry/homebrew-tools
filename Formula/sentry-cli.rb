class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.30.5/sentry-cli-Darwin-x86_64"
  version "1.30.5"
  sha256 "2e25a5253fecfaf4dccdba7dd405908abfad52530f30209f1ca9e707d0a2528e"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
