class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://downloads.sentry-cdn.com/sentry-cli/1.47.1/sentry-cli-Darwin-x86_64"
  version "1.47.1"
  sha256 "8f1b3ff02876232c3b1fbdc49f7c0e69c687d98ef942d7d3623d3d4a34bf3a3c"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
