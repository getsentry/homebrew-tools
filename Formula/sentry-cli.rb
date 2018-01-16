class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.28.2/sentry-cli-Darwin-x86_64"
  version "1.28.2"
  sha256 "ca7f8145bd79c3f67879a2d94e8e075ccf8c18ba204153b94620167c40de6d4b"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
