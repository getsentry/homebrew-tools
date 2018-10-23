class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://downloads.sentry-cdn.com/sentry-cli/1.36.3/sentry-cli-Darwin-x86_64"
  version "1.36.3"
  sha256 "c49d7421735c1dd76b45511291eeeb538d3984bf8014c98f7ff46d1b79b6092b"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
