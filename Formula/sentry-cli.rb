class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://downloads.sentry-cdn.com/sentry-cli/1.36.4/sentry-cli-Darwin-x86_64"
  version "1.36.4"
  sha256 "2b3aa2fff15ec24ea2bb7a2d7467cccaaef238f88aa32b741f4376d73c992393"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
