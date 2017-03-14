class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/0.27.0/sentry-cli-Darwin-x86_64"
  version "0.27.0"
  sha256 "8b3ff8c2fadcc43c7becdf385a79e4fb11c4ac1e0dbd63f049230e2a81a65e14"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
