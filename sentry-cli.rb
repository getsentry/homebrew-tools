class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.1.0/sentry-cli-Darwin-x86_64"
  version "1.1.0"
  sha256 "0cccbb6e9fffd5266923967b27567b1fe5ed870e60fa79a2d2bb2463f6b6b6f4"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
