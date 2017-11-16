class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.23.0/sentry-cli-Darwin-x86_64"
  version "1.23.0"
  sha256 "b0a25dba74b1955826c849bbc6bbe5113a53facdcda9dbe3d76c67d3b444ed48"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
