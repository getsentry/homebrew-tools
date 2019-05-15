class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://downloads.sentry-cdn.com/sentry-cli/1.43.0/sentry-cli-Darwin-x86_64"
  version "1.43.0"
  sha256 "821de8d9aee27ecc0d0406ff3f898ea8b078ed567088fcb9a2940c88256262e7"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
