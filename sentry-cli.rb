class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/0.24.0/sentry-cli-Darwin-x86_64"
  version "0.25.0"
  sha256 "3162b500173ba6a20d9563ec7dce199625e7dbc637eccc44304af3a8b13f4569"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
