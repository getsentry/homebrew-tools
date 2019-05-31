class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://downloads.sentry-cdn.com/sentry-cli/1.44.2/sentry-cli-Darwin-x86_64"
  version "1.44.2"
  sha256 "a745d1fdae9de37ebdaa2e66f0812a9ac71b29b1fc7e90967825c0fd668f4ee0"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
