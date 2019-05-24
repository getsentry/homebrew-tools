class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://downloads.sentry-cdn.com/sentry-cli/1.44.1/sentry-cli-Darwin-x86_64"
  version "1.44.1"
  sha256 "c0f4346b6bab798081694f4529a95cf4b2c3ab091e880e68eee28a5cd13dd3be"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
