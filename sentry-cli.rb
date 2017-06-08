class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.13.2/sentry-cli-Darwin-x86_64"
  version "1.13.2"
  sha256 "f52d48a0017a88bc8ed3101ee31b23579f826bb2e2ffbb3d97aa7fbe2d1c7018"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
