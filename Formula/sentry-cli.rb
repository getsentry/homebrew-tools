class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.28.4/sentry-cli-Darwin-x86_64"
  version "1.28.4"
  sha256 "c0f9bffd1e4207dc2ebc3bd22230a9f018516463b4ff7b837aa0d135507a230d"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
